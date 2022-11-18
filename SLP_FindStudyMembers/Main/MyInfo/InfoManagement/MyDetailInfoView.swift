//
//  MyDetailInfo.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit
import MultiSlider

class MyDetailInfoView: BaseView {
    
    let genderTitle: UILabel = {
        let view = UILabel()
        view.text = " 내성별"
        return view
    }()
    
    let studyTitle: UILabel = {
        let view = UILabel()
        view.text = "자주 하는 스터디"
        return view
        
    }()
    
    let numPermitTitle: UILabel = {
        let view = UILabel()
        view.text = "내 번호 검색 허용"
        return view
    }()
    
    let ageTitle: UILabel = {
        let view = UILabel()
        view.text = "상대방 연령대"
        return view
    }()
    
    let withdrawalButton: UIButton = {
        let view = UIButton()
        view.setTitle("회원탈퇴", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14)
        view.setTitleColor(.label, for: .normal)
        return view
    }()
    
    let maleButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("남자", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let femaleButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("여자", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let studyTextField: UITextField = {
       let view = UITextField()
        view.placeholder = "스터디를 입력 해주세요."
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let textFieldUnderline: UILabel = {
       let view = UILabel()
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 0.5

        return view
    }()
    
    let numPermitSwitch: UISwitch = {
        let view = UISwitch()
        return view
    }()
    
    let ageLabel: UILabel = {
        let view = UILabel()
        return view
        
    }()

    let ageSlider: MultiSlider = {
        let view = MultiSlider()
        view.orientation = .horizontal
        view.thumbTintColor = Constants.Color.customGreen
        view.tintColor = Constants.Color.customGreen
        view.outerTrackColor = UIColor.systemGray3
        view.snapStepSize = 1
        view.minimumValue = 17
        view.maximumValue = 65
        view.value = [17,65]
        
        return view
    }()
    
    func labelSetting() {
        [genderTitle,studyTitle,ageTitle,numPermitTitle].forEach { $0.font = .systemFont(ofSize: 14) }
    }
    
    override func configure() {
        labelSetting()
        
        [genderTitle, studyTitle, numPermitTitle, ageTitle, withdrawalButton, maleButton, femaleButton, studyTextField, textFieldUnderline, numPermitSwitch, ageLabel, ageSlider].forEach { addSubview($0) }
    }
    
    override func setConstraints() {
        let leadingMargin = 16
        let topMargins = 42
        
        genderTitle.snp.makeConstraints { make in
            make.leading.equalTo(leadingMargin)
            make.top.equalToSuperview().inset(topMargins)
            
        }
        
        studyTitle.snp.makeConstraints { make in
            make.leading.equalTo(leadingMargin)
            make.top.equalTo(genderTitle.snp.bottom).offset(topMargins)
        }
        
        numPermitTitle.snp.makeConstraints { make in
            make.leading.equalTo(leadingMargin)
            make.top.equalTo(studyTitle.snp.bottom).offset(topMargins)
        }
        
        ageTitle.snp.makeConstraints { make in
            make.leading.equalTo(leadingMargin)
            make.top.equalTo(numPermitTitle.snp.bottom).offset(topMargins)
        }

        femaleButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(24)
            make.width.equalTo(56)
            make.height.equalTo(48)
        }
        maleButton.snp.makeConstraints { make in
            make.trailing.equalTo(femaleButton.snp.leading).offset(-8)
            make.top.equalToSuperview().inset(24)
            make.width.equalTo(56)
            make.height.equalTo(48)
        }
        
        studyTextField.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(32)
            make.top.equalTo(maleButton.snp.bottom).offset(28)
            
        }
        
        textFieldUnderline.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(studyTextField.snp.bottom).offset(12)
            make.width.equalTo(164)
            make.height.equalTo(1)
        }
        
        numPermitSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(studyTextField.snp.bottom).offset(38)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(numPermitSwitch.snp.bottom).offset(38)
        }
        
        ageSlider.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(28)
            make.top.equalTo(ageTitle.snp.bottom).offset(24)
        }
        
        withdrawalButton.snp.makeConstraints { make in
            make.leading.equalTo(leadingMargin)
            make.top.equalTo(ageSlider.snp.bottom).offset(8)
        }
        
        
    }
    
}
