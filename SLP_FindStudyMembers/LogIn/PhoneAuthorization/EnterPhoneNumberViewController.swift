//
//  EnterPhoneNumberViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit


import FirebaseAuth

final class EnterPhoneNumberViewController: BaseViewController {
    
    private let mainView = EnterPhoneNumberView()
    
    private let viewModel = LogInViewModel()
    
    var verificationCode = ""
//
//
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
    }
    
    func UIBind() {
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                if vc.viewModel.authNumValidation {
                    vc.requestFBAuth(verificationCode: vc.verificationCode)
                } else {
                    vc.mainView.makeToast("인증번호는 6자리를 입력해주세요", position: .top)
                }
                
            }
            .disposed(by: disposeBag)
        
        mainView.userTextField.rx.text.orEmpty
            .bind(to: viewModel.authNumber)
            .disposed(by: disposeBag)
        
        mainView.userTextField.rx
            .controlEvent([.editingDidEndOnExit])
            .subscribe { _ in
            print("editingDidEndOnExit")
                self.mainView.endEditing(true)
            }
            .disposed(by: disposeBag)
        
        viewModel.checkAuthNumValidation()
        
        viewModel.authNumber
            .withUnretained(self)
            .subscribe { (vc,value) in
                let color =  vc.viewModel.authNumValidation ? Constants.Color.customGreen : UIColor.systemGray3
                vc.mainView.confirmButton.backgroundColor = color
                vc.verificationCode = value
                
            }
            .disposed(by: disposeBag)
    }
    
    
    
    func requestFBAuth(verificationCode: String) { //apimanager로 이동
        
        guard let id = UserDefaults.standard.string(forKey: "authVerificationID") else { //id 새로 받기
            print("invalid ID")
            return
            
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: id,
            verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            if let error = error as NSError? {
                guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else { return }
                switch errorCode {
                case .userTokenExpired, .sessionExpired, .invalidVerificationID:
                    self?.mainView.makeToast("전화번호 인증 실패", position: .top)
                default:
                    self?.mainView.makeToast("에러가 발생했습니다, 다시 시도해주세요", position: .top)
                }
              return
            }
    
            authResult?.user.getIDToken { idToken, error in
                if let error = error as NSError? {
                    guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else { return }
                    switch errorCode {
                    case .userTokenExpired, .sessionExpired, .invalidVerificationID:
                        self?.mainView.makeToast("전화번호 인증 실패", position: .top)
                    default:
                        self?.mainView.makeToast("에러가 발생했습니다, 다시 시도해주세요", position: .top)
                        return
                    }
                    //
                    
                }
                guard let idToken = idToken else { return }
//                UserDefaultManager.idToken = idToken
                UserDefaultManager.setUserDefault(key: .idToken, value: idToken)
                print(idToken)
                print("iD Value", UserDefaultManager.getUserDefault(key: .idToken))
            }
            print("signed in")
            
            LoginAPIManager.share.getUserInfo { code, userInfo in
                
                if code == 406 { //서버 미가입자
                    self?.mainView.makeToast("인증성공. 회원가입 절차를 시작합니다.", position: .top)
                    self?.transition(NickNameViewController(), transitionStyle: .push)
                }else if code == 200 { //서버 기가입자
                    self?.mainView.makeToast("이미 가입된 사용자입니다.", position: .top)
                    self?.transition(TabBarController(), transitionStyle: .push)
                }
            }
            
//            self?.transition(NickNameViewController(), transitionStyle: .push)
        }
    }
    
}
