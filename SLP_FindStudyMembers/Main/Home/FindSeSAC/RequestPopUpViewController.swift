//
//  RequestPopUpViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/03.
//

import Foundation


final class RequestPopUpViewController: BaseViewController {
    
    let mainView = PopUpView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.titleLabel.text = "스터디를 요청할게요!"
        mainView.bodyLabel.text = "상대방이 요청을 수락하면 /n 채팅창에서 대화를 나눌 수 있어요"
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
                print("요청하기") //스터디 요청 네트워크 필요
            }
            .disposed(by: disposeBag)
    }
    
}
