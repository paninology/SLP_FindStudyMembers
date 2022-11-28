//
//  EnterStudyKeywordViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/22.
//


import UIKit
import RegexBuilder


final class EnterStudyKeywordViewController: BaseViewController {
    
    let mainView = EnterStudyKeywordView()
    
    let viewModel = HomeViewModel()
    
    let searchBar:UISearchBar = {
       let view = UISearchBar()
        view.placeholder = "띄어쓰기로 복수 입력이 가능해요."
        return view
    }()
    
    var currentCoordinator: (Double,Double)?
    
    var searchInfo: SearchSeSAC?
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    let cellRegistration = UICollectionView.CellRegistration<StudyKeywordCell, String>.init { cell, indexPath, itemIdentifier in
        cell.KeywordLabel.text = itemIdentifier
     }

    override func loadView() {
        super.loadView()
        view = mainView
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        UIBind()
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.titleView = searchBar
        requestSearchInfo()
    }
    
    private func UIBind() {
        

        searchBar.rx.searchButtonClicked
            .withUnretained(self)
            .bind { (vc,_) in
                print("tttpppp")
                vc.viewModel.enterKeyword()
                vc.searchBar.text = ""
            }
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .withUnretained(self)
            .bind { (vc,value) in
                vc.viewModel.keyword =  value
            }
            .disposed(by: disposeBag)
        
        viewModel.suggestStudyKeword
            .withUnretained(self)
            .bind { (vc,value) in
                print("suggested", value)
                var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
                snapshot.appendSections([0])
                snapshot.appendItems(value)
                vc.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)

    }
    func requestSearchInfo() {
        guard let currentCoordinator = currentCoordinator else {
            mainView.makeToast("현재 위치설정이 잘못 되었습니다.")
            return }
        QueueAPIManager.share.requestSearch(lat: currentCoordinator.0, long: currentCoordinator.1) {
            print("sucesslllll")
        }
    }
    
}


extension EnterStudyKeywordViewController {

    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<StudyKeywordCell, String>.init { cell, indexPath, itemIdentifier in
            cell.KeywordLabel.text = "  \(itemIdentifier)  "
            
            print("item",itemIdentifier)
        }
   
        
        //collectionView.dataSource = self
        //numberOfItemsInSection, cellForItemAt
        dataSource = UICollectionViewDiffableDataSource(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
           
            return cell
            
        })
        
    }
}
