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
    
    lazy var verificationCode
    
   
    
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
                vc.transition(NickNameViewController(), transitionStyle: .push)
            }
            .disposed(by: disposeBag)
    }
    
    func requestSignIn() {
        
        guard let id = UserDefaults.standard.string(forKey: "authVerificationID") else { //id 새로 받기
            print("invalid ID")
            return
            
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: id,
          verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
              let authError = error as NSError
              if isMFAEnabled, authError.code == AuthErrorCode.secondFactorRequired.rawValue {
                // The user is a multi-factor user. Second factor challenge is required.
                let resolver = authError
                  .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                var displayNameString = ""
                for tmpFactorInfo in resolver.hints {
                  displayNameString += tmpFactorInfo.displayName ?? ""
                  displayNameString += " "
                }
                self.showTextInputPrompt(
                  withMessage: "Select factor to sign in\n\(displayNameString)",
                  completionBlock: { userPressedOK, displayName in
                    var selectedHint: PhoneMultiFactorInfo?
                    for tmpFactorInfo in resolver.hints {
                      if displayName == tmpFactorInfo.displayName {
                        selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
                      }
                    }
                    PhoneAuthProvider.provider()
                      .verifyPhoneNumber(with: selectedHint!, uiDelegate: nil,
                                         multiFactorSession: resolver
                                           .session) { verificationID, error in
                        if error != nil {
                          print(
                            "Multi factor start sign in failed. Error: \(error.debugDescription)"
                          )
                        } else {
                          self.showTextInputPrompt(
                            withMessage: "Verification code for \(selectedHint?.displayName ?? "")",
                            completionBlock: { userPressedOK, verificationCode in
                              let credential: PhoneAuthCredential? = PhoneAuthProvider.provider()
                                .credential(withVerificationID: verificationID!,
                                            verificationCode: verificationCode!)
                              let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator
                                .assertion(with: credential!)
                              resolver.resolveSignIn(with: assertion!) { authResult, error in
                                if error != nil {
                                  print(
                                    "Multi factor finanlize sign in failed. Error: \(error.debugDescription)"
                                  )
                                } else {
                                  self.navigationController?.popViewController(animated: true)
                                }
                              }
                            }
                          )
                        }
                      }
                  }
                )
              } else {
                self.showMessagePrompt(error.localizedDescription)
                return
              }
              // ...
              return
            }
            // User is signed in
            // ...
        }
    }
    
}
