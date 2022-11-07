//
//  EnterPhoneNumberView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import Foundation


class EnterPhoneNumberView: LogInView {
    
    let resendButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("재전송", for: .normal)
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
        addSubview(resendButton)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        resendButton.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.top)
            make.bottom.equalTo(userTextField.snp.bottom)
            make.trailing.equalToSuperview().inset(16)
            make.width.equalTo(72)

        }
        
        userTextField.snp.makeConstraints { make in
            make.trailing.equalTo(resendButton.snp.leading).offset(8)
        }
        
    }
}
