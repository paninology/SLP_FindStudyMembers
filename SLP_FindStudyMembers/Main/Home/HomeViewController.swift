//
//  HomeViewController.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/16.
//

import UIKit
import CoreLocation
import MapKit


final class HomeViewContoller: BaseViewController {
    
    let mainView = HomeView()
    
    let locationManager = CLLocationManager()
    
    override func loadView() {
        super.loadView()
        view = mainView
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        let center = CLLocationCoordinate2D(latitude: 37.517819364682694, longitude: 126.88647317074734)
        setRegionAndAnnotation(center: center)
        UIBind()
        navigationItem.backButtonTitle = ""

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    private func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        //지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 700, longitudinalMeters: 700)
        mainView.mapView.setRegion(region, animated: true)
        
        //핀 추가
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = center
//        annotation.title = "당산역"
//        mainView.mapView.addAnnotation(annotation)
    }
    
    func UIBind() {
        mainView.findButton.rx.tap
            .withUnretained(self)
            .bind { (vc,_) in
                let view = EnterStudyKeywordViewController()
                view.currentCoordinator = (37.517819364682694,126.88647317074734)
                vc.transition(view, transitionStyle: .push)
                
            }
            .disposed(by: disposeBag)
            
    }
}

extension HomeViewContoller: CLLocationManagerDelegate {
    
    //Location5. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function, locations)
        //ex. 위도 경도 기반으로 날씨 정보를 조회
        if let coordinate = locations.last?.coordinate {
            print("sssss")
            setRegionAndAnnotation(center: coordinate)
            //날씨 정보 API 요청
        }
        
        //위치 없데이트 멈춰!! 택시나 네비같은경우 아니라면 계속 받아 올 필요가 있는지 고민
        locationManager.stopUpdatingLocation()
    }
    
    //Location6. 사용자의 위치를 못 가지고 온경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
        print("location Farilded")
    }
   
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) { //초기화 될 때 한번 실행된다. 즉 앱 실행할때 호출됨. 그래서 뷰디드로드에 말고 그냥 여기서 호출해도됨
        print(#function)
        print("locationDiddddddddchanged")
        checkUserDeviceLocationServiceAuthorization() //아예 첨부터 시작. 위치서비스를 끌 수도 있어서
    }
    
    
}

//위치 관련된 User Defined 메서드
extension HomeViewContoller {

    //Location7. iOS 버전에 따른 분기 처리 및 iOS 위치 서비스 활성화 여부 확인
    //-denied: 허용 안함/ 설정에서 추후에 거부/ 위치 서비스 중지/ 비행기 모드
    //-restricted: 앱에서 권한 자체가 없는 경우/ 자녀 보호 기능 같은걸로 아예 제한
    func checkUserDeviceLocationServiceAuthorization() {
        print("111111")
        let authorizationStatus: CLAuthorizationStatus
        
        authorizationStatus = locationManager.authorizationStatus
       
        //iOS 위치 서비스 활성화 여부 체크
        if CLLocationManager.locationServicesEnabled() {
            //위치 서비스가 활성화 되어 있으므로, 위치 권한 요청 가능. 위치 권한을 요청함
            checkUserCurrentLaocationAuthorization(authorizationStatus)
        } else {
            print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다. 위치 서비스를 켜주세요")
        }
        
    }
    
    //Location8. 사용자의 위치 권항 상태 확인
        //사용자가 위치를 허용했는지, 거부했는지, 아직 선택하지 않았는지 등을 확인(단, 사전에 iOS 위치 서비스 활성화 꼭 확인)
    func checkUserCurrentLaocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .notDetermined:
            print("Not Determined")
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() //앱를 사용하는 동안에 대한 위치 권한 요청
            //plist whenInUse -> request 메서드 OK 되어있어야함
//            locationManager.startUpdatingLocation() //없어도 괜찮나? didChange가 있기 때문에
            
        case .restricted, .denied:
            print("Denied, 아이폰 설정으로 유도")
        case .authorizedWhenInUse:
            print("When In Use")
            //사용자가 위치를 허용해둔 상태라면, startUpdatingLocation을 통해 didUpdateLocations 메서드가 실행
            locationManager.startUpdatingLocation()
        default: print("Default")
        }
    }
    
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
          //설정화면까지 이동 / 설정 세부화면까지 이동
          //한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이거나에 따라 다르다
          if let appSetting = URL(string: UIApplication.openSettingsURLString) {
              UIApplication.shared.open(appSetting)
          }
          
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
}

extension HomeViewContoller: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) { //지도 움직일때
        locationManager.startUpdatingLocation()
        print("현위치", locationManager.location)
    }
    
    //지도에 커스텀 핀 추가
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//    }
    

}
