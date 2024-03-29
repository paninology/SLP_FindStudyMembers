//
//  SceneDelegate.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        guard UserDefaultManager.getIntUserDefault(key: .isFirstUser) == 1  else {
            self.window?.rootViewController = IntroViewController()
            return
        }
//        let vc = PhoneAuthoViewController()
//        LoginAPIManager.share.refreshIDToken()
//        let home = HomeViewContoller()
//        let navi = UINavigationController(rootViewController: home)
        self.window?.rootViewController = IntroViewController()

        //아래가 정상. 위는 테스트용
        // 1. 첫 사용자 >> 아이디토큰 없음/ 서버 미가입 >> 번호인증 후 회원가입절차
        // 1-2. 첫 사용자(파베 인증만 완료. 중도에 앱끔) >> 아이디토큰 있음/ 겟서버통신 406 >> 바로 회원가입창(닉네임)
        // 2. 타기기 사용자 >> 아이디토큰 없음/ 서버 기가입 >> 번호인증 후 홈탭으로
        // 3. 기존(같은기기) 사용자 >>아이디토큰 있음/ 겟서버통신200>> 서버 회원가입 유무 네트워크 판단 >> 신델리게이트에서 바로 홈탭
        // 아이디토큰 유무검사 >>토큰 없으면 일단 번호인증>>토큰받고 겟 서버통신으로 가입유무 판단
//        UserDefaults.standard.removeObject(forKey: "\(userDefaultData.idToken)")
       /*
        print("dddddd idtoken",UserDefaultManager.getUserDefault(key: .idToken))
        APIManager.share.refreshIDToken() //클로져로 아래 통신 넣기
        
        if UserDefaultManager.getUserDefault(key: .idToken) != "" { //번호인증 된경우(기존사용자+가입 중도실패자)
            APIManager.share.getUserInfo { [weak self] code, userInfo in
                if code == 406 { //서버 미가입자 >>테스트완료
                    print("406 미가입자입니다")
                    let vc = NickNameViewController()
                    let navi = UINavigationController(rootViewController: vc)
                    self?.window?.rootViewController = navi
                }else if code == 200 { //서버 기가입자 >>테스트 완료. but 토큰 다시받는 스레드 이슈 있음
                    let vc = TabBarController()
                    self?.window?.rootViewController = vc
                    
                } else if code == 401 { //토큰오류
                    print("토큰오류")
                    
                } else {
                    print("통신오류. 회원가입절차 실행")
                    let vc = NickNameViewController()
                    let navi = UINavigationController(rootViewController: vc)
                    self?.window?.rootViewController = navi
                }
            }
          
        } else { //번호인증 안된경우(서버만 된경우+아예처음)
            let vc = PhoneAuthoViewController()
            let navi = UINavigationController(rootViewController: vc)
            window?.rootViewController = navi
        }
        
       */
        
      
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

