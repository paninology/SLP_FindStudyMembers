//
//  CardViewCell.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/01.
//

import UIKit

class CardViewCell: UITableViewCell {
    
    let card = ProfileCardView()
    
    let requestButton: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(card)
        contentView.addSubview(requestButton)
        
        card.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.height.equalTo(300)
        }
        requestButton.snp.makeConstraints { make in
            make.top.equalTo(card.backgroundImageView.snp.top).inset(12)
            make.trailing.equalToSuperview().inset(28)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
