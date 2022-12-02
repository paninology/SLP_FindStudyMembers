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
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(card)
        addSubview(requestButton)
        print("cardCEll============")
       
        card.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.height.equalTo(300)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
