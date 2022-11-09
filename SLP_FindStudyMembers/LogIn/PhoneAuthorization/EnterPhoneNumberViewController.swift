//
//  EnterPhoneNumberViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit

final class EnterPhoneNumberViewController: BaseViewController {
    
    private let mainView = EnterPhoneNumberView()
    
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
    
}
