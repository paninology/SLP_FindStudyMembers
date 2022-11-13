//
//  LogInViewModel.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseAuth


final class LogInViewModel {
    
    let phoneNumber = PublishSubject<String>() //Int?? 인풋용
    
    let phoneNumForLabel = PublishSubject<String>() //아웃풋용
    
    let phoneValidataion = PublishSubject<Bool>()
    
    let birthday = BehaviorSubject<Date>(value: Date())
    
    var ageValidation = true
    
    let userEmail = PublishSubject<String>()
    
    var emailValidation = true
    
    let userGender = PublishSubject<Int>() //0:남 1:여
    
    let disposeBag = DisposeBag()
    
    
    func convertPhoneNum() {
        
        phoneNumber
            .withUnretained(self)
            .subscribe { (vc,value) in
                vc.phoneNumForLabel.onNext(vc.addHyphen(num: value))
        }
            .disposed(by: disposeBag)
    }
    
    func checkValidation(input: Bool) {

        phoneValidataion.onNext(input)
        
    }
    
    func checkAgeValidation() {
        func age(birthday: Date) -> Int {
            print("age",Calendar.current.dateComponents([.year], from: birthday, to: Date()).year ?? 0)
            return Calendar.current.dateComponents([.year], from: birthday, to: Date()).year ?? 0
        }
        
        birthday //dispose 관리...
            .map{ age(birthday: $0) >= 17 }
            .withUnretained(self)
            .subscribe { (vc,value) in
                vc.ageValidation = value
            }
            .disposed(by: disposeBag)
    }
    
    func addHyphen(num: String)-> String {
        let res = num.replacingOccurrences(of: "-", with: "")
        
        return res.count == 10 ? num.applyPatternOnNumbers(pattern: "###-###-####", replacementCharacter: "#") : num.applyPatternOnNumbers(pattern: "###-####-####", replacementCharacter: "#")
    }
    
    func requestPhoneAuth(phoneNumber: String, view: UIView, vc: UIViewController) {
        Auth.auth().languageCode = "kr"
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationID, error in
              if let error = error {
                  view.makeToast(error.localizedDescription)
                  print("error",error.localizedDescription)
                
                return
              }
              
              UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
              print("success",verificationID)
              vc.transition(EnterPhoneNumberViewController(), transitionStyle: .push)
          }
    }
    
    
    
    func checkEmailValidation() {
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        
        userEmail
            .map { isValidEmail($0)}
            .withUnretained(self)
            .subscribe { (vc,value) in
                vc.emailValidation = value
            }
            .disposed(by: disposeBag)
    }
    
    
}
