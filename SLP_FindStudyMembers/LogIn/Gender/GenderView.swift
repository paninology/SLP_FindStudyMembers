//
//  GenderView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/13.
//

import UIKit

final class GenderView: LogInView {
    
    let subLabel: UILabel = {
       let view = UILabel()
        view.text = "새싹 찾기 기능을 이용하기 위해서 필요해요!"
        view.textAlignment = .center
        return view
    }()
    
    let maleButton: UIButton = {
        let view = UIButton(configuration: .plain())
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 0.5
        view.setTitle("남자", for: .normal)
        view.setImage(UIImage(named: "man"), for: .normal)
        var config = UIButton.Configuration.plain()
        config.imagePlacement = .top
        config.titleAlignment = .center
        view.configuration = config
        view.setTitleColor(.black, for: .normal)
      
        return view
    }()
    
    let femaleButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 0.5
        view.setTitle("여자", for: .normal)
        view.setImage(UIImage(named: "woman"), for: .normal)
        var config = UIButton.Configuration.plain()
        config.imagePlacement = .top
        config.titleAlignment = .center
        view.configuration = config
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainLabel.text = "성별을 입력해주세요"
        confirmButton.setTitle("다음", for: .normal)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        [subLabel, maleButton, femaleButton].forEach { addSubview($0)}
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        mainLabel.snp.updateConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(110)
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.centerX.equalToSuperview()

        }
        
        maleButton.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(16)
            make.leading.equalTo(16)
            make.height.equalTo(120)
            make.width.equalToSuperview().multipliedBy(0.44)
        }
        femaleButton.snp.makeConstraints { make in
            make.top.equalTo(subLabel.snp.bottom).offset(16)
            make.trailing.equalTo(-16)
            make.height.equalTo(120)
            make.width.equalToSuperview().multipliedBy(0.44)
        }
    }
}
