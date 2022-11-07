//
//  PhoneAuthView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit

class PhoneAuthoView: LogInView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userTextField.placeholder = "  휴대폰 번호(-없이 숫자만 입력)"
        confirmButton.setTitle("인증문자 받기", for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
