//
//  StudyKewordCell.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/23.
//

import UIKit


class StudyKeywordCell: UICollectionViewCell {
    
    let KeywordLabel: UILabel = {
       let view = UILabel()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.text = "test"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(KeywordLabel)
        KeywordLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
