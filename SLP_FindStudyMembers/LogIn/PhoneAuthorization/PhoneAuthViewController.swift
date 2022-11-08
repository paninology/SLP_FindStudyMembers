//
//  PhoneAuthViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit
import RxCocoa
import RxSwift


class PhoneAuthoViewController: UIViewController {
    
    let mainView = PhoneAuthoView()
    
    let disposeBag = DisposeBag()
    
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
            .bind { (vc, _) in
                vc.transition(EnterPhoneNumberViewController(), transitionStyle: .push)
            }
            .disposed(by: disposeBag)
            
    }
    
}
