//
//  HomeView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/19.
//

import UIKit
import MapKit
import CoreLocation


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
    
    let genderPickSegment: UISegmentedControl = {
       let view = UISegmentedControl()
        return view
    }()
    
    let currentLocationButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    let findButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    
    
    
    override func configure() {
        [mapView, centerPin, genderPickSegment, currentLocationButton, findButton].forEach { addSubview($0) }
        
    }
    
    
    override func setConstraints() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centerPin.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
