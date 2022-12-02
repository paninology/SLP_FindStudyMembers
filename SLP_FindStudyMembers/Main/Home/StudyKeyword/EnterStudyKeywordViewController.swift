//
//  EnterStudyKeywordViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/22.
//


import UIKit


final class EnterStudyKeywordViewController: BaseViewController {
    
    private let mainView = EnterStudyKeywordView()
    
    let viewModel = HomeViewModel()

    var currentCoordinator: (Double,Double)?
    
    private var searchInfo: SearchSeSAC?  {
        willSet {
            makeSnapShot(value0: newValue, value1: ["test333"])
        }

    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    let cellRegistration = UICollectionView.CellRegistration<StudyKeywordCell, String>.init { cell, indexPath, itemIdentifier in
//        cell.KeywordLabel.text = itemIdentifier
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
        self.navigationItem.titleView = mainView.searchBar
        requestSearchInfo()
    }
    
    private func UIBind() {

        mainView.searchBar.rx.searchButtonClicked
            .withUnretained(self)
            .bind { (vc,_) in
                print("tttpppp")
                vc.viewModel.enterKeyword()
                vc.mainView.searchBar.text = ""
            }
            .disposed(by: disposeBag)
        
        mainView.searchBar.rx.text.orEmpty
            .withUnretained(self)
            .bind { (vc,value) in
                vc.viewModel.keyword =  value
            }
            .disposed(by: disposeBag)
        
        mainView.findButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                vc.transition(FindSeSACViewController(), transitionStyle: .push)
            }
            .disposed(by: disposeBag)
        
        viewModel.suggestStudyKeword
            .withUnretained(self)
            .bind { (vc,value) in
                vc.makeSnapShot(value0: vc.searchInfo, value1: value)
            }
            .disposed(by: disposeBag)
        
        

    }
    func requestSearchInfo() {
        guard let currentCoordinator = currentCoordinator else {
            mainView.makeToast("현재 위치설정이 잘못 되었습니다.")
            return }
        QueueAPIManager.share.requestSearch(lat: currentCoordinator.0, long: currentCoordinator.1) { [weak self] data in
            self?.searchInfo = data
        }
    }
    
    func makeSnapShot(value0: SearchSeSAC?, value1: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        var nearStudyList: [String] = value0?.fromRecommend ?? []
        
        for i in value0?.fromQueueDB ?? [] {
            nearStudyList.append(contentsOf: i.studylist)
//            nearStudyList.insert(i.studylist)
        }
        for i in value0?.fromQueueDBRequested ?? [] {
            nearStudyList.append(contentsOf: i.studylist)
        }
        let res = Array(Set(nearStudyList))
        print("res",res)
        snapshot.appendSections([0,1])
        snapshot.appendItems(res, toSection: 0)
//        snapshot.appendItems(value0?.fromRecommend ?? [], toSection: 1)
        snapshot.appendItems(value1, toSection: 1)
        
        dataSource.apply(snapshot)
    }
    
}

extension EnterStudyKeywordViewController {
    
    
    
    private func configureDataSource() {
        
        let headerRegistration = UICollectionView.SupplementaryRegistration
               <TitleSupplementaryView>(elementKind: "section-header-element-kind") {
                   (supplementaryView, string, indexPath) in
                   if indexPath.section == 0 {
                       supplementaryView.label.text = "지금 주변에는"
                   }else {
                       supplementaryView.label.text = "내가 하고싶은"
                   }
               }
        
        let cellRegistration = UICollectionView.CellRegistration<StudyKeywordCell, String>.init { cell, indexPath, itemIdentifier in

            cell.KeywordLabel.font = .systemFont(ofSize: 14)
            
            if indexPath.section == 0 {
                cell.KeywordLabel.text = "  \(itemIdentifier)  "
                cell.KeywordLabel.layer.borderColor = UIColor.gray.cgColor
                cell.KeywordLabel.textColor = UIColor.gray
            } else {
                cell.KeywordLabel.text = "  \(itemIdentifier) X "
                cell.KeywordLabel.layer.borderColor = Constants.Color.customGreen.cgColor
                cell.KeywordLabel.textColor = Constants.Color.customGreen
            }
        }
        
        //collectionView.dataSource = self
        //numberOfItemsInSection, cellForItemAt
        dataSource = UICollectionViewDiffableDataSource(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)

            return cell
            
        })
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return self.mainView.collectionView.dequeueConfiguredReusableSupplementary(
                        using: headerRegistration , for: index)
                }
        
    }
}

class TitleSupplementaryView: UICollectionReusableView {
    let label = UILabel()
    //...
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


