//
//  IntroViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/05.
//

import UIKit


class IntroViewController: BaseViewController {
    
//    let view: [UIView] = [
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.frame = UIScreen.main.bounds
        view.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(imageNames.count), height: UIScreen.main.bounds.height)
        view.delegate = self // scroll범위에 따라 pageControl의 값을 바꾸어주기 위한 delegate
        view.alwaysBounceVertical = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = true
        view.isPagingEnabled = true
        view.bounces = false // 경계지점에서 bounce될건지 체크 (첫 or 마지막 페이지에서 바운스 스크롤 효과 여부)
        return view
    }()
    
    let startButton: GreenCurvedButton = {
        let view = GreenCurvedButton()
        view.setTitle("시작하기", for: .normal)
        return view
    }()
    
    let pageControll: UIPageControl = {
        let view = UIPageControl()
        view.currentPage = 0
        view.numberOfPages = 3
        view.pageIndicatorTintColor = .lightGray // 페이지를 암시하는 동그란 점의 색상
        view.currentPageIndicatorTintColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configure() {
        view.addSubview(startButton)
        
    }
    
    
}
