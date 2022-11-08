//
//  EnterPhoneNumberView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit


class EnterPhoneNumberView: LogInView {
    
    let userTextField: UITextField = {
        let view = UITextField()
        
        return view
    }()
    
    let resendButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("재전송", for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainLabel.text = "인증번호가 문자로 전송되었어요"
        userTextField.placeholder = "  인증번호 입력"
        userTextField.keyboardType = .numberPad
        confirmButton.backgroundColor = .lightGray
        confirmButton.setTitle("인증하고 시작하기", for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configure() {
        super.configure()

        [resendButton, userTextField].forEach { addSubview($0) }
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(64)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.trailing.equalTo(resendButton.snp.leading).offset(-8)
            
        }
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(64)
            make.bottom.equalTo(userTextField.snp.bottom)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(90)

        }
        
        
        
    }
}
