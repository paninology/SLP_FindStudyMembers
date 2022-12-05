//
//  IntroView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/05.
//

import UIKit

class IntroView: BaseView {
    
    let mainLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 24)
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect, text: String) {
        super.init(frame: frame)
    }
    
    override func configure() {
        super.configure()
        addSubview(mainLabel)
        addSubview(imageView)
    }
    
    override func setConstraints() {
        super.setConstraints()
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(72)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(56)
            make.bottom.equalToSuperview()
        }
    }
}
