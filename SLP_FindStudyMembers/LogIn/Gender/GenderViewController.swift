//
//  GenderViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/13.
//

import UIKit


class GenderViewController: BaseViewController {
    
    let mainView = GenderView()
    
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
        
        mainView.maleButton.rx.tap
            .map {0}
//            .withUnretained(self)
            .bind (to: viewModel.userGender)
            .disposed(by: disposeBag)
        
        mainView.femaleButton.rx.tap
            .map {1}
            .bind (to: viewModel.userGender)
            .disposed(by: disposeBag)
        
        viewModel.userGender
            .withUnretained(self)
            .bind { (vc,value) in
                switch value {
                case 0: maleOn()
                case 1: femaleOn()
                default: bothOff()
                }
            }
            .disposed(by: disposeBag)
        
        func maleOn() {
            mainView.maleButton.backgroundColor = Constants.Color.lightGreen
            mainView.femaleButton.backgroundColor = .clear
        }
        func femaleOn() {
            mainView.maleButton.backgroundColor = .clear
            mainView.femaleButton.backgroundColor = Constants.Color.lightGreen
        }
        func bothOff() {
            mainView.maleButton.backgroundColor = .clear
            mainView.femaleButton.backgroundColor = .clear
        }
            
    }
}
