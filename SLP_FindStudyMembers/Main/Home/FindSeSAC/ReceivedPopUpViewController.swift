//
//  ReceivedPopUpViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/03.
//

import Foundation

final class ReceivedPopUpViewController: BaseViewController {
  
    let mainView = PopUpView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.titleLabel.text = "스터디를 수락할까요?"
        mainView.bodyLabel.text = "요청을 수락하면 채팅창에서 대화를 나눌 수 있어요"
        UIBind()
    }
    
    func UIBind() {
        mainView.cancelButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                vc.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                print("수락하기") //스터디 요청 네트워크 필요
            }
            .disposed(by: disposeBag)
    }
    
}
