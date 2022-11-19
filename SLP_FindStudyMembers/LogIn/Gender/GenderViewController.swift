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
        mainView.confirmButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                APIManager.share.requestSignIn {
                    print("메인으로 고고씽")
                    vc.transition(TabBarController(), transitionStyle: .toHomeTab)
                    
                }
            }
            .disposed(by: disposeBag)
        
        mainView.maleButton.rx.tap
            .map {1}
//            .withUnretained(self)
            .bind (to: viewModel.userGender)
            .disposed(by: disposeBag)
        
        mainView.femaleButton.rx.tap
            .map {0}
            .bind (to: viewModel.userGender)
            .disposed(by: disposeBag)
        
        viewModel.userGender
            .withUnretained(self)
            .bind { (vc,value) in
                UserDefaultManager.setUserDefault(key: .gender, value: value)
                switch value {
                case 1: maleOn()
                case 0: femaleOn()
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
