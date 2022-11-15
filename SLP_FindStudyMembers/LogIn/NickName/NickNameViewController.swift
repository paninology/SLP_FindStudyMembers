//
//  NickNameViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/09.
//

import UIKit

final class NickNameViewController: BaseViewController {
  
    private let mainView = NickNameView()
    
    private let viewModel = LogInViewModel()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
    }
    
    func UIBind() {
        mainView.userTextField.rx
            .text.orEmpty
            .bind(to: viewModel.userNickName)
            .disposed(by: disposeBag)
        
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc,value) in
                if vc.viewModel.nicknameValidation {
                    vc.transition(BirthdayViewController(), transitionStyle: .push)
                } else {
                    vc.mainView.makeToast("닉네임은 1자 이상 10자 이내로 부탁드려요.", position: .top)
                }
            }
        viewModel.userNickName //버튼탭하면 저장되게 바꾸고싶은데
            .bind { value in
                UserDefaultManager.setUserDefault(key: .nickName, value: value)
            }
            .disposed(by: disposeBag)
        
        viewModel.checknicknameValidation()
    }
}
