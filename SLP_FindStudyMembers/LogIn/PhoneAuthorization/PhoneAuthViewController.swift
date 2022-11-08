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
    
    let viewModel = LogInViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
        viewModel.convertPhoneNum()
        viewModel.checkValidation()
        
    }
    
    func UIBind() {
        
        mainView.userTextField.rx.text
            .orEmpty
            .asDriver(onErrorJustReturn: "")
            .drive { [weak self] value in
                self?.viewModel.phoneNumber.onNext(value)
                print(value)
            }
            .disposed(by: disposeBag)
        
        mainView.userTextField.rx.text
            .orEmpty
            .map { $0.replacingOccurrences(of: "-", with: "") }
            .map { $0.count == 10 || $0.count == 11 }
            .withUnretained(self)
            .bind { (vc, value) in
//                self?.viewModel.phoneNumber.onNext(value)
                let color =  value ? Constants.Color.customGreen : UIColor.systemGray3
                vc.mainView.confirmButton.backgroundColor = color
            }
            .disposed(by: disposeBag)
        
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.transition(EnterPhoneNumberViewController(), transitionStyle: .push)
            }
            .disposed(by: disposeBag)
        
        
            
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
            
    }
    
    
    
}
