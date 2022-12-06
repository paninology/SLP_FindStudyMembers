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
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {

        [mainLabel,imageView].forEach { addSubview($0) }

    }
    
    override func setConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(110)
            make.height.equalTo(76)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).inset(24)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
