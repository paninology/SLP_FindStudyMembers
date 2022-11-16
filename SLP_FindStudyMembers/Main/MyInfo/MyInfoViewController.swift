//
//  MyInfoViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit

class MyInfoViewController: BaseViewController {
    
    let mainView = MyInfoView()
    
    let cellTitles = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "이용 약관"]
    let cellImageNames = ["notice", "faq", "qna", "setting_alarm", "permit"]
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    
}

extension MyInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = "test 이용석"
            cell.textLabel?.font = .boldSystemFont(ofSize: 16)
            cell.accessoryType = .disclosureIndicator
        
            return cell
            
            
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = cellTitles[indexPath.row]
            cell.imageView?.image = UIImage(named: cellImageNames[indexPath.row])
            cell.textLabel?.font = .systemFont(ofSize: 16)
            
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 96 : 74
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
        }
    }
    
    
}
