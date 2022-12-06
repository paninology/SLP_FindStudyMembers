//
//  SecondIntroView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/05.
//

import UIKit

class SecondIntroView: IntroView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainLabel.text = "스터디를 원하는 친구를 \n 찾을 수 있어요"
        imageView.image = UIImage(named: "onboarding_img2")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
