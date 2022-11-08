//
//  ChangeView+Extensions.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/08.
//

import UIKit


extension UIViewController {
    
    enum TransitionStyle {
        case present //네비게이션 없이
        case presentNavigation //네비게이션 임베드 프레젠드
        case presentFull//네ㅇ비게이션 풀스크린
        case push
        case presentOverFull
//        case popUpToPreView
    }
    
    func transition<T: UIViewController>(_ viewController: T, transitionStyle: TransitionStyle = .present) {
        
        switch transitionStyle {
        case .present:
            self.present(viewController, animated: true)
        case .presentNavigation:
            let navi = UINavigationController(rootViewController: viewController)
            self.present(navi, animated: true)
        case .push:
            self.navigationController?.pushViewController(viewController, animated: true)
        case .presentFull:
            self.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        case.presentOverFull:
            self.modalPresentationStyle = .overFullScreen
            self.present(viewController, animated: true)
//        case.popUpToPreView:
//            self.navigationController?.popViewController(animated: true)
        }
    }
  
    
}

