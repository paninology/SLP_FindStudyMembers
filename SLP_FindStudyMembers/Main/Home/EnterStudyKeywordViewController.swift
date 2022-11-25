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
//        mainView.collectionView.delegate = self
        configureDataSource()
        UIBind()
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.titleView = searchBar
    }
    
    private func UIBind() {
        
        searchBar.rx.textDidEndEditing
            .withUnretained(self)
            .bind { (vc, _) in
                vc.viewModel.enterKeyword()
                print("end")
            }
        searchBar.rx.searchButtonClicked
            .bind { _ in
                print("tttpppp")
                self.viewModel.enterKeyword()
            }
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.enteredKeyword)
            .disposed(by: disposeBag)
        
        viewModel.suggestStudyKeword
            .withUnretained(self)
            .bind { (vc,value) in
                var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
                snapshot.appendSections([0])
                snapshot.appendItems(value)
                vc.dataSource.apply(snapshot)
            }
            .disposed(by: disposeBag)
        
        viewModel.enteredKeyword
            .withUnretained(self)
            .bind { (vc,value) in
                print(value)
            }
            .disposed(by: disposeBag)
    }
    
}

//extension EnterStudyKeywordViewController: UICollectionViewDelegate {
//
//}

extension EnterStudyKeywordViewController {

    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<StudyKeywordCell, String>.init { cell, indexPath, itemIdentifier in
            cell.KeywordLabel.text = "test11"
            print(itemIdentifier)
        }
   
        
        //collectionView.dataSource = self
        //numberOfItemsInSection, cellForItemAt
        dataSource = UICollectionViewDiffableDataSource(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
            
        })
        
    }
}
