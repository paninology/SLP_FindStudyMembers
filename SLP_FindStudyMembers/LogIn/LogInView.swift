//
//  LogInView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit
import SnapKit

class LogInView: BaseView {
    
    let mainLabel: UILabel = {
        let view = UILabel()
        view.text = "새싹 서비스 이용을 위해 \n 휴대폰 번호를 입력해 주세요"
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 20)
        view.textAlignment = .center
        

        return view
    }()
    
    let userTextField: UITextField = {
        let view = UITextField()
        
        return view
    }()
    
    let textFieldUnderLine: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let confirmButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        backgroundColor = Constants.Color.background
        [mainLabel, userTextField, confirmButton].forEach { addSubview($0) }
    }
    
    override func setConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(125)
            make.horizontalEdges.equalToSuperview().inset(74)
            make.height.equalTo(64)
        }
        userTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(64)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(72)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
    }
    
    
}
