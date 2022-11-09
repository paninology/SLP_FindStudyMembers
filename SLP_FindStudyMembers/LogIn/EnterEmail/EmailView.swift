//
//  EmailView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/12.
//

import UIKit

final class EmailView: PhoneAuthoView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userTextField.placeholder = "SeSAC@email.com"
        mainLabel.text = "이메일을 입력 해주세요"
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
