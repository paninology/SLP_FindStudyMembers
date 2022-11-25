//
//  HomeViewModel.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/23.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire


final class HomeViewModel {
    
    let suggestStudyKeword = PublishSubject<[String]>()
    
    let enteredKeyword = PublishSubject<String>()
    
    func enterKeyword() {
        suggestStudyKeword.bind { <#[String]#> in
            <#code#>
        }
        print("11111", enteredKeyword, suggestStudyKeword)
        
    }
    
    func requestNearbyUsers() {
//        let api = API
        
//        AF.request(<#T##convertible: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
    }
    
}
