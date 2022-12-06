//
//  TestVC.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/06.
//

import UIKit


class TestVC: ViewController {
   
    let mainView = IntroView()
    
    override func loadView() {
        super.loadView()
        view = mainView
        mainView.backgroundColor = .brown
        mainView.mainLabel.text = "tttt"
        mainView.imageView.image = UIImage(named: "onboarding_img1")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
