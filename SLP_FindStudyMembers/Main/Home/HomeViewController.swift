//
//  HomeViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit

class HomeViewContoller: BaseViewController {
    
    let mainView = HomeView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//class HomeViewController: uita
