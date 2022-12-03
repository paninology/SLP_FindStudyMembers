//
//  EmptyView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/03.
//

import UIKit

class EmptyView: BaseView {
    
    let image: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let mainLabel: UILabel = {
        let view = UILabel()
        return view
        
    }()
    
    let subLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let changeButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("스터디 변경하기", for: .normal)
        return view
    }()
    
    let refreshButton: UIButton = {
       let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderColor = Constants.Color.customGreen.cgColor
        view.layer.borderWidth = 1
        view.tintColor = Constants.Color.customGreen
        return view
    }()
    
    override func configure() {
        super.configure()
        [image,mainLabel,subLabel,changeButton, refreshButton].forEach{ addSubview($0) }
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        mainLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(8)
            
        }
        
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(mainLabel.snp.top).offset(-44)
        }
        
        changeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(48)
        }
        
        refreshButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
            make.height.width.equalTo(48)
            make.leading.equalTo(changeButton.snp.trailing).offset(8)
        }
    }
}
