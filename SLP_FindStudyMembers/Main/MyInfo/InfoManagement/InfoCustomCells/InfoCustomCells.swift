//
//  InfoCustomCells.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit


class InfoCustomCell: UITableViewCell {
    
    let titleLable: UILabel = {
       let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(titleLable)
    }
    
    func setConstraints() {
        titleLable.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
        }
    }

}

final class myGenderCell: InfoCustomCell {
    
}
