//
//  InfoTableView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/17.
//

import UIKit


class InfoTableView: BaseView {
    
    
    let tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
      
        return view
    }()
    
    
    override func configure() {
        addSubview(tableView)
    }
    override func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

class InfoDetailTableViewCell: UITableViewCell  {
    
    let detailView: MyDetailInfoView = {
       let view = MyDetailInfoView()
        return view
    }()
  

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
            contentView.addSubview(detailView)
      
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }


    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class InfoCardTableViewCell: UITableViewCell  {
    
    let cardView = ProfileCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
            contentView.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        cardView.backgroundImageView.image = UIImage(named: "sesac_bg_01")
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

