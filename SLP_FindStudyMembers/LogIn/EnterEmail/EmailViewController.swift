//
//  EmailViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/12.
//
import UIKit

import RxCocoa
import RxSwift

final class EmailViewController: BaseViewController {
  
    private let mainView = EmailView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.textFieldUnderLine.layer.borderColor = mainView.userTextField.isEditing ? UIColor.black.cgColor : UIColor.systemGray6.cgColor
    }
    
    func UIBind() {
        
    }
}
