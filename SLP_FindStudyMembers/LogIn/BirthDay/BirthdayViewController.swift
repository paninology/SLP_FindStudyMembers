//
//  BirthdayViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/09.
//

import UIKit
import RxSwift
import RxCocoa

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
    }
    
}
