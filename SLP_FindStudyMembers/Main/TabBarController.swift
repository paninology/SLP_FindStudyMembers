//
//  TabBarController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    private func setupVCs() {
          viewControllers = [
              createNavController(for: ViewController(), title: NSLocalizedString("홈", comment: ""), image: UIImage(systemName: "house")!),
              createNavController(for: ViewController(), title: NSLocalizedString("새싹샵", comment: ""), image: UIImage(systemName: "gift")!),
              createNavController(for: ViewController(), title: NSLocalizedString("새싹친구", comment: ""), image: UIImage(named: "sprout")!),
              createNavController(for: MyInfoViewController(), title: NSLocalizedString("내정보", comment: ""), image: UIImage(systemName: "person")!)
          ]
      }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }
}
