//
//  EnterPhoneNumberViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit

class EnterPhoneNumberViewController: UIViewController {
    
    let mainView = EnterPhoneNumberView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
