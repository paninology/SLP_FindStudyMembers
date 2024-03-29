//
//  PhoneAuthView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit

class PhoneAuthoView: LogInView {
    
    let userTextField: UITextField = {
        let view = UITextField()
        
        return view
    }()
    
    let textFieldUnderLine: UILabel = {
        let view = UILabel()
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userTextField.placeholder = "  휴대폰 번호(-없이 숫자만 입력)"
        userTextField.keyboardType = .numberPad
        confirmButton.backgroundColor = .lightGray
        confirmButton.setTitle("인증문자 받기", for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        addSubview(userTextField)
        addSubview(textFieldUnderLine)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(64)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        textFieldUnderLine.snp.makeConstraints { make in
            make.bottom.equalTo(userTextField.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
    }
      
}
