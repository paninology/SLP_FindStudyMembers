//
//  MyDetailInfo.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit

class MyDetailInfoView: BaseView {
    
    let genderTitle: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let studyTitle: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let numPermitTitle: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let ageTitle: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let withdrawalButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    let maleButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        return view
    }()
    
    let femaleButton: GreenCurvedButton = {
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
        <#code#>
    }
    
    override func setConstraints() {
        <#code#>
    }
    
}
