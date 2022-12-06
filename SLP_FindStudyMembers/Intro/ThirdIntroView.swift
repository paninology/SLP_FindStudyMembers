//
//  ThirdIntroView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/05.
//

import UIKit

class ThirdIntroView: IntroView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainLabel.text = "SeSAC Study"
        imageView.image = UIImage(named: "onboarding_img3")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
