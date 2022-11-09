//
//  NickNameViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/09.
//

import UIKit

final class NickNameViewController: BaseViewController {
  
    private let mainView = NickNameView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
