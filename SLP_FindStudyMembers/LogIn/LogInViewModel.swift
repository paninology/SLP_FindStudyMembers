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
    
    let validataion = PublishSubject<Bool>()
    
    let disposeBag = DisposeBag()
    
    
    func convertPhoneNum() {
        
        phoneNumber
            .withUnretained(self)
            .subscribe { (vc,value) in
                print("phoen",value)
                vc.phoneNumForLabel.onNext(vc.addHyphen(num: value))
        }
            .disposed(by: disposeBag)
    }
    
    func checkValidation(input: Bool) {

        validataion.onNext(input)
        
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
    
    
}
