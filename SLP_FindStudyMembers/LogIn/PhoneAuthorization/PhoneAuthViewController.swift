//
//  PhoneAuthViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit

import Toast
import FirebaseAuth
//import RxCocoa
//import RxSwift


final class PhoneAuthoViewController: BaseViewController {
    
    private let mainView = PhoneAuthoView()
    
    private let viewModel = LogInViewModel()
//    private let disposeBag = DisposeBag()
    
    private var validation = false
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
        viewModel.convertPhoneNum()
       
        
    }
    
    private func UIBind() {
        
        mainView.userTextField.rx.text
            .orEmpty
            .asDriver(onErrorJustReturn: "")
            .drive { [weak self] value in
                self?.viewModel.phoneNumber.onNext(value)
                print(value)
            }
            .disposed(by: disposeBag)
        
        mainView.userTextField.rx.text //viewmodel로 유효성검사 옮기자
            .orEmpty
            .map { $0.replacingOccurrences(of: "-", with: "") }
            .map { $0.count == 10 || $0.count == 11 }
            .withUnretained(self)
            .bind { (vc, value) in
                vc.viewModel.checkValidation(input: value)
    
            }
            .disposed(by: disposeBag)
        
        
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                if vc.validation {
//                    vc.requestPhoneAuth(phoneNumber: "+821038994681")
                    vc.sendRequest()
                }else {
                    vc.mainView.makeToast("유효하지 않은 전화번호 형식입니다.")
                }
                
            }
            .disposed(by: disposeBag)
        
//        mainView.confirmButton.rx.tap
//            .map { }
//            .withUnretained(self)
//            .bind { (vc, _) in
//                vc.transition(EnterPhoneNumberViewController(), transitionStyle: .push)
//            }
//            .disposed(by: disposeBag)
        
            
        viewModel.phoneNumForLabel
            .withUnretained(self)
            .subscribe { (vc,value) in
                vc.mainView.userTextField.rx.text
                    .onNext(value)
            }
            .disposed(by: disposeBag)
        
//        viewModel.validataion
//            .withUnretained(self)
//            .
            
        viewModel.validataion
            .withUnretained(self)
            .subscribe { (vc, value) in
                let color =  value ? Constants.Color.customGreen : UIColor.systemGray3
                vc.mainView.confirmButton.backgroundColor = color
                vc.validation = value
            }
            .disposed(by: disposeBag)
    }
    
    func sendRequest() {
//        viewModel.phoneNumber
//            .map { $0.replacingOccurrences(of: "-", with: "") }
//            .withUnretained(self)
//            .bind { (vc, value) in
//                vc.requestPhoneAuth(phoneNumber: value)
//                print("ddddd",value)
//            }
//            .disposed(by: disposeBag)
        
        mainView.userTextField.rx.text //viewmodel로
            .orEmpty
            .map { $0.replacingOccurrences(of: "-", with: "") }
            .map { "+82" + $0.dropFirst() }
            .withUnretained(self)
            .bind { (vc, value) in
                vc.requestPhoneAuth(phoneNumber: value)
                print("ddddd",value)
            }
            .dispose()
        
     
    }
    
    func requestPhoneAuth(phoneNumber: String) {
        Auth.auth().languageCode = "kr"
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationID, error in
              if let error = error {
                  self?.mainView.makeToast(error.localizedDescription)
                  print("error",error.localizedDescription)
                
                return
              }
              
              UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
              print("success",verificationID)
              self?.transition(EnterPhoneNumberViewController(), transitionStyle: .push)
          }
    }
    
}
