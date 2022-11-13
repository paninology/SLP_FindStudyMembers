//
//  EmailView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/12.
//

import UIKit

final class EmailView: PhoneAuthoView {
    
    let subLabel: UILabel = {
       let view = UILabel()
        view.text = "휴대폰 번호 변경시 인증을 위해 사용해요"
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userTextField.placeholder = "SeSAC@email.com"
        mainLabel.text = "이메일을 입력 해주세요"
        confirmButton.setTitle("다음", for: .normal)
        userTextField.keyboardType = .emailAddress
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        addSubview(subLabel)
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        mainLabel.snp.updateConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(110)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.centerX.equalToSuperview()
//            make.horizontalEdges.equalTo(mainLabel.snp.horizontalEdges)

        }
    }
}
