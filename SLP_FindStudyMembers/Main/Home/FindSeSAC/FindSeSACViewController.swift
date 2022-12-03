//
//  FindSeSACViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/30.
//

import UIKit

import Tabman
import Pageboy


class FindSeSACViewController: TabmanViewController {

    private var viewControllers = [NearSeSACViewController(), ReceivedRequestViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        navigationItem.title = "새싹찾기"
        navigationController?.navigationBar.backgroundColor = .systemBackground

        // Create bar
        setTapMan()
    }
    
    func setTapMan() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentMode = .fit
        bar.layout.alignment = .centerDistributed
        bar.backgroundView.style = .flat(color: .systemBackground)
        bar.indicator.tintColor = Constants.Color.customGreen
        bar.buttons.customize { (button) in
            button.font = .systemFont(ofSize: 14)
            button.tintColor = Constants.Color.customGreen
            button.selectedTintColor = Constants.Color.customGreen
        }
         // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
}

extension FindSeSACViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        let title = index == 0 ? "주변 새싹" : "받은요청"
        return TMBarItem(title: title)
    }
}
