//
//  HomeView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/19.
//

import UIKit
import MapKit
//import CoreLocation


class HomeView: BaseView {
    
    let mapView: MKMapView = {
        let view = MKMapView()
        return view
    }()
    
    let centerPin: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "centerPin")
        return view
    }()
    
//    let genderPickSegment: UISegmentedControl = {
//       let view = UISegmentedControl()
//
//        return view
//    }()
    
    let genderPickStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.backgroundColor = .white
        view.alignment = .fill
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        
        let bothButton: UIButton = {
           let view = UIButton()
            view.setTitle("전체", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 14)
            view.setTitleColor(.black, for: .normal)
            view.backgroundColor = Constants.Color.customGreen
            return view
        }()
        
        let maleButton: UIButton = {
            let view = UIButton()
             view.setTitle("남자", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 14)
            view.setTitleColor(.black, for: .normal)
             return view
         }()
        
        let femaleButton : UIButton = {
            let view = UIButton()
             view.setTitle("여자", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 14)
            view.setTitleColor(.black, for: .normal)
//            view.contentVerticalAlignment = .center
             return view
         }()
        
        [bothButton, maleButton, femaleButton].forEach{ view.addArrangedSubview($0) }
        
        return view
    }()
    
    let currentLocationButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "place"), for: .normal)
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let findButton: UIButton = {
        let view = UIButton()
//        view.backgroundColor = .black
        view.setImage(UIImage(named: "Property 1=default"), for: .normal)
//        view.layer.cornerRadius = 32
//        view.clipsToBounds = true
        return view
    }()
    
    
    
    
    override func configure() {
        [mapView, centerPin, genderPickStackView, currentLocationButton, findButton].forEach { addSubview($0) }
        
    }
    
    
    override func setConstraints() {
        mapView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        centerPin.snp.makeConstraints { make in
            make.center.equalTo(mapView.snp.center)
        }
        
        genderPickStackView.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(52)
            make.width.equalTo(48)
            make.height.equalTo(144)
        }
        
        currentLocationButton.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(genderPickStackView.snp.bottom).offset(16)
            make.height.width.equalTo(48)
        }
        
        findButton.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.bottom.equalTo(-100)
            make.height.width.equalTo(64)
        }
        
    }
    
}
