//
//  NickNameView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/09.
//

import UIKit

final class NickNameView: PhoneAuthoView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userTextField.placeholder = "10자 이내로 입력"
        mainLabel.text = "닉네임을 입력해 주세요"
        confirmButton.setTitle("다음", for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
    }
    
    override func setConstraints() {
        super.setConstraints()
    }
}
