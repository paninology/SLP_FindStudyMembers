//
//  FirstIntroView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/05.
//

import UIKit


class FirstIntroView: IntroView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainLabel.text = "위치기반으로 빠르게 \n 주위 친구들을 확인"
        imageView.image = UIImage(named: "onboarding_img1")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
