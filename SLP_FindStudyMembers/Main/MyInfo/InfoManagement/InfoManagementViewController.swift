//
//  InfoManagementViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit
import MultiSlider



final class InfoManagementViewController: BaseViewController {
    
//    let mainView = InfoManagementView()
    let mainView = InfoTableView()
    
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
       

//        mainView.profileCardView.nameLabel.text = "test"
//        mainView.profileCardView.backgroundImageView.image = UIImage(named: "sesac_bg_01")
    }
    
    private func UIBind() {
      
    }
    
    @objc func sliderValueChanged(slider: MultiSlider) {
        print("thumb \(slider.draggedThumbIndex) moved")
            print("now thumbs are at \(slider.value)")
        
    }
    
    @objc func maleButtonClicked(sender: UIButton) {
        print(" moved")
            print("nodf")
    }

    
}

extension InfoManagementViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = InfoCardTableViewCell()
            cell.cardView.nameLabel.text = "test"
            cell.cardView.sproutImageView.image = UIImage(named: "sesac_face_2")
            cell.selectionStyle = .none
            return cell
        } else {            
            let cell = InfoDetailTableViewCell()
            cell.selectionStyle = .none
//            cell.detailView.ageSlider.rx.maximumValue
            cell.detailView.maleButton.addTarget(self, action: #selector(maleButtonClicked), for: .touchUpInside)
                
            cell.detailView.ageSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
           
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        200
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 270
        } else {
            return 400
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
