//
//  StudyKeywordView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/22.
//

import UIKit

final class EnterStudyKeywordView: BaseView {
    
//    let searchBar: UISearchBar = {
//        let view = UISearchBar()
//        return view
//    }()
    let searchBar: UISearchBar = {
       let view = UISearchBar()
        view.placeholder = "띄어쓰기로 복수 입력이 가능해요."
        return view
    }()
    
    let findButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("새싹 찾기", for: .normal)
        return view
    }()
    
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
         func createLayout() -> UICollectionViewLayout {
            let config = UICollectionViewCompositionalLayoutConfiguration()
            let layout = createCompositionalLayout()
            layout.configuration = config
            return layout
        }
        
        func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
            return UICollectionViewCompositionalLayout { (sectionIndex, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

                if sectionIndex == 1 {
                    
                }
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .estimated(50))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item] )
//                group.interItemSpacing = .fixed(8)
                
                let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .estimated(44))
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize, elementKind:"section-header-element-kind", alignment: .top)

                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.interGroupSpacing = 8
                section.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
                print("index",sectionIndex)
                return section
                
            }
        }
        
        return view
    }()
    
    override func configure() {
        [ findButton, collectionView].forEach { addSubview($0) }
    }
    
    override func setConstraints() {
        findButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(48)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
//        searchBar.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide)
//            make.horizontalEdges.equalToSuperview()
//            make.height.equalTo(48)
//        }
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(findButton.snp.top)
            make.top.equalTo(safeAreaLayoutGuide)
        }
    }
    
    
    
}
