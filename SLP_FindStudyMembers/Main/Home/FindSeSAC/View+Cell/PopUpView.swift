//
//  PopUpViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/02.
//

import UIKit

class PopUpView: BaseView {
    
    let centerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    let bodyLabel: UILabel = {
       let view = UILabel()
        view.textColor = .gray
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let cancelButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("취소", for: .normal)
        view.backgroundColor = .lightGray
        return view
    }()
    
    let confirmButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("확인", for: .normal)
        return view
    }()
 
    override func configure() {
        [centerView, titleLabel, bodyLabel, cancelButton, confirmButton].forEach {self.addSubview($0)}
        backgroundColor = .clear
    }
    
    override func setConstraints() {
        centerView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(160)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(centerView.snp.horizontalEdges).inset(16)
            make.top.equalTo(centerView.snp.top).inset(16)
            
        }
        bodyLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(titleLabel.snp.horizontalEdges)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(centerView.snp.leading).inset(16)
            make.bottom.equalTo(centerView.snp.bottom).inset(16)
            make.width.equalTo(centerView.snp.width).multipliedBy(0.45)
            make.height.equalTo(48)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.trailing.equalTo(centerView.snp.trailing).inset(16)
            make.bottom.equalTo(centerView.snp.bottom).inset(16)
            make.width.equalTo(centerView.snp.width).multipliedBy(0.45)
            make.height.equalTo(48)
        }
    }
    
    
}
