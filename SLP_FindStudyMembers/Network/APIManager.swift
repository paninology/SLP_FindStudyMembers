//
//  APIManager.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/14.
//

import Foundation

import Alamofire


class APIManager {
    
    let share = APIManager()
    
    private init() {}
    
    func requestSignIn() {
        let url = EndPoint.SeSACBaseURL + "/v1/" + URLSuffix.user.rawValue
        
//        AF.request(url, method: .get, parameters: <#T##Encodable?#>, encoder: <#T##ParameterEncoder#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
    }
}
