//
//  IntroViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/12/05.
//

import UIKit


class IntroViewController: BaseViewController {
    
    let views: [IntroView] = [ FirstIntroView(), SecondIntroView(), ThirdIntroView()]
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.frame = UIScreen.main.bounds

        view.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(views.count), height: UIScreen.main.bounds.height * 0.8)
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
    
    lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.currentPage = 0
        view.numberOfPages = views.count
        view.pageIndicatorTintColor = .lightGray // 페이지를 암시하는 동그란 점의 색상
        view.currentPageIndicatorTintColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setViews()
        setConstraints()
        UIBind()
    }
    
    func configure() {
        [scrollView, startButton, pageControl].forEach { view.addSubview($0)}
        view.backgroundColor = .systemBackground
        
    }
    
    func UIBind() {
        startButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                vc.restart()
            }
            .disposed(by: disposeBag)
        
        
    }
    
    func restart() {
        //ios13 SceneDelegate 쓸때 가능
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate

        let vc = PhoneAuthoViewController()
        let navi = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = navi
        sceneDelegate?.window?.makeKeyAndVisible()
        
        UserDefaultManager.setUserDefault(key: .isFirstUser, value: 1)
    }
    
    func setViews() {
        for (index, view) in views.enumerated() {
//            view.frame = UIScreen.main.bounds
            view.frame = self.scrollView.frame
//            view.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            view.frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            scrollView.addSubview(view)
        }
    }
    func setConstraints() {
        startButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(startButton.snp.top).offset(-16)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview()

            make.bottom.equalTo(pageControl.snp.top)
        }
    }
    
    
}

extension IntroViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
        
        
    }
}
