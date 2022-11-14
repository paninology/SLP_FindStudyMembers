//
//  BirthdayViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/09.
//

import UIKit

import Toast

class BirthdayViewController: BaseViewController {
    
    let mainView = BirthdayView()

    let viewModel = LogInViewModel()

    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIBind()
    }
    
    func UIBind() {
        
        
        mainView.datePicker.rx
            .date
            .bind(to: viewModel.birthday)
            .disposed(by: disposeBag)
        
        mainView.confirmButton.rx
            .tap
            .withUnretained(self)
            .bind { (vc,_) in
                if vc.viewModel.ageValidation {
                    vc.transition(EmailViewController(), transitionStyle: .push)
                } else {
                    vc.mainView.makeToast("새싹스터디는 만 17세 이상만 사용할 수 있습니다.")
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.birthday
            .withUnretained(self)
            .subscribe { (vc, value) in
                let formatter = DateFormatter()
                formatter.dateFormat = "YYYY"
                vc.mainView.yearLabel.text = formatter.string(from: value)
                formatter.dateFormat = "MM"
                vc.mainView.monthLabel.text = formatter.string(from: value)
                formatter.dateFormat = "dd"
                vc.mainView.dayLabel.text = formatter.string(from: value)
            }
            .disposed(by: disposeBag)
        
        viewModel.checkAgeValidation()
    }
    
}
