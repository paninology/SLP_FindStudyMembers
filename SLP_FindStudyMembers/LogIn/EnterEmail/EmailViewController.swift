//
//  EmailViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/12.
//
import UIKit


final class EmailViewController: BaseViewController {
  
    private let mainView = EmailView()
    
    private let viewModel = LogInViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
//        mainView.textFieldUnderLine.layer.borderColor = mainView.userTextField.isEditing ? UIColor.black.cgColor : UIColor.systemGray6.cgColor
    }
    
    func UIBind() {
        viewModel.checkEmailValidation()
        
        mainView.userTextField.rx.text
            .orEmpty
            .withUnretained(self)
            .bind { (vc, value) in
                vc.viewModel.userEmail.onNext(value)
                UserDefaultManager.setUserDefault(key: .userEmail, value: value)
                let color =  vc.viewModel.emailValidation ? Constants.Color.customGreen : UIColor.systemGray3
                vc.mainView.confirmButton.backgroundColor = color
                
            }
            .disposed(by: disposeBag)
        
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                if vc.viewModel.emailValidation {
                    print("email ok")
                    vc.transition(GenderViewController(), transitionStyle: .push)
                } else {
                    vc.mainView.makeToast("이메일 형식이 올바르지 않습니다.")
                }
            }
            .disposed(by: disposeBag)
            
        
    }
    
    
}
