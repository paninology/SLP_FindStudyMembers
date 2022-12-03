//
//  ProfileCardView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/17.
//

import UIKit


class ProfileCardView: BaseView {
    
    let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let sproutImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let profileView: UIView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 0.5
        view.clipsToBounds = true
  
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "test1"
        return view
    }()
    
    let indicator: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.down")
        return view
    }()
    
    override func configure() {
        [backgroundImageView, sproutImageView, indicator, profileView, nameLabel].forEach { addSubview($0) }

    }
    
    override func setConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(24)
//            make.bottom.equalToSuperview()
            make.bottom.equalTo(profileView.snp.top)
//            make.height.equalTo(200)
        }
        
        sproutImageView.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundImageView.snp.bottom).inset(9)
            make.top.equalTo(backgroundImageView.snp.top).offset(19)
//          make.width.equalTo(sproutImageView.snp.height)
//          make.width.equalTo(70)
            make.centerX.equalToSuperview()
        }
        
        profileView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.top.equalTo(backgroundImageView.snp.bottom)
            
            make.height.equalTo(58)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.top).inset(16)
            make.leading.equalTo(32)
        }
        
        indicator.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.top).inset(20)
//          make.bottom.equalTo(profileView.snp.bottom).inset(26)
            make.trailing.equalTo(profileView.snp.trailing).inset(18)
   
        }
    }
}
