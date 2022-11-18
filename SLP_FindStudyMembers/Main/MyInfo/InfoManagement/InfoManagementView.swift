//
//  InfoManagementView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit


class InfoManagementView: BaseView {
    

    
    
    let profileCardView: ProfileCardView = {
        let view = ProfileCardView()
        return view
    }()
    
    let myDetailInfoView: MyDetailInfoView = {
        let view = MyDetailInfoView()
        return view
    }()
    
    
    override func configure() {

        addSubview(myDetailInfoView)
        addSubview(profileCardView)
    }
    
    override func setConstraints() {
        
    
        profileCardView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
//            make.height.eq
        }
        
        myDetailInfoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(profileCardView.snp.bottom).offset(16)
        }
    }
    
}
