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
        [mainLabel, confirmButton].forEach { addSubview($0) }
        
    }
    
    override func setConstraints() {

        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(120)
            make.horizontalEdges.equalToSuperview().inset(44)
            make.height.equalTo(64)
        }

        confirmButton.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(mainLabel.snp.bottom).offset(200)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
       
    }
    
    
}
