//
//  GenderViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/13.
//

import UIKit

class GenderViewController: BaseViewController {
    
    let mainView = GenderView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
