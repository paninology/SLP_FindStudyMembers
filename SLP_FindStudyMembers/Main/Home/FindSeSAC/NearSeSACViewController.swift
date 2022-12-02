//
//  NearSeSACViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/01.
//

import UIKit


class NearSeSACViewController: BaseViewController {
    
    let tableView:UITableView = {
        let view = UITableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setConstraints()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        print("viewcon============")
        print(tableView.rowHeight, tableView.estimatedRowHeight)
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 200

    }
    
    
}

extension NearSeSACViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CardViewCell()
        cell.card.nameLabel.text = "test"
        cell.card.backgroundImageView.image = UIImage(named: "sesac_bg_01")
        print(cell.heightAnchor)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        print("estimated============")
        print(tableView.rowHeight, tableView.estimatedRowHeight)
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("heit============")
        print(tableView.rowHeight, tableView.estimatedRowHeight)
        return UITableView.automaticDimension
//        280
    }
    
   
    
    
}
