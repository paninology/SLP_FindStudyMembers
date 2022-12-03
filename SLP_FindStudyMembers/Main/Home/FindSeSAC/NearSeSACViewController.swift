//
//  NearSeSACViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/01.
//

import UIKit


final class NearSeSACViewController: BaseViewController {
    
    
    fileprivate let tableView:UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        
        return view
    }()
    
    private var nearSeSAC: SearchSeSAC? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var currentCoordinator: (Double,Double)? {
        didSet {
            requestSearchInfo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setConstraints()
        tableView.delegate = self
        tableView.dataSource = self
//        currentCoordinator = (37.517819364682694,126.88647317074734)
        currentCoordinator = UserDefaults.standard.object(forKey: "\(userDefaultData.myCoordinate)") as? (Double, Double) ?? (37.517819364682694,126.88647317074734) //기본값 수정할것
        
    }
  
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    private func requestSearchInfo() {
        guard let currentCoordinator = currentCoordinator else {
            view.makeToast("현재 위치설정이 잘못 되었습니다.")
            return }
        QueueAPIManager.share.requestSearch(lat: currentCoordinator.0, long: currentCoordinator.1) { [weak self] data in
            self?.nearSeSAC = data
        }
    }
    @objc
    fileprivate func requestButtonClicked() {
        print("요청하기 클릭!")
        transition(RequestPopUpViewController(), transitionStyle: .presentOverFull)
    }
    
    
}

extension NearSeSACViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nearSeSAC?.fromQueueDB.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CardViewCell()
        guard let seSAC = nearSeSAC?.fromQueueDB else { return cell }
        let backgroundNum = seSAC[indexPath.row].background == 0 ? 1 : seSAC[indexPath.row].background
        cell.card.nameLabel.text = seSAC[indexPath.row].nick
        cell.card.backgroundImageView.image = UIImage(named: Constants.AssetNames.seSACBackgroundImage + backgroundNum.description)
        cell.selectionStyle = .none
        cell.requestButton.setTitle("요청하기", for: .normal)
        cell.requestButton.addTarget(self, action: #selector(requestButtonClicked), for: .touchUpInside)
        cell.requestButton.backgroundColor = UIColor(red: 0.91, green: 0.4, blue: 0.42, alpha: 1)
        cell.requestButton.titleLabel?.font = .systemFont(ofSize: 14)

        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
   
    
    
}
