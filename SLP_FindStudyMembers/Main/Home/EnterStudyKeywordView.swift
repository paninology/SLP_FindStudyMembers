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
    
    let findButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("새싹 찾기", for: .normal)
        return view
    }()
    
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
         func createLayout() -> UICollectionViewLayout {
            let config = UICollectionViewCompositionalLayoutConfiguration()
            let layout = createCompositionalLayout()
            layout.configuration = config
            return layout
        }
        
        func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
            return UICollectionViewCompositionalLayout { (sectionIndex, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in                       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .absolute(140))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
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
