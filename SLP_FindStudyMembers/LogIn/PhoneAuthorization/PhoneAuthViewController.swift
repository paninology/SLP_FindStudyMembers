//
//  PhoneAuthViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit
import RxCocoa


class PhoneAuthoViewController: UIViewController {
    
    let mainView = PhoneAuthoView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
