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
//        let url = EndPoint.SeSACBaseURL + "/v1/" + URLSuffix.user.rawValue
        let api = SeSACStudyAPI.signIn(
            phoneNumber: UserDefaultManager.getUserDefault(key: .phoneNumber),
            FCMtoken: UserDefaultManager.getUserDefault(key: .phoneNumber),
            nick: UserDefaultManager.getUserDefault(key: .nickName),
            birth: UserDefaultManager.getUserDefault(key: .birthday),
            email: UserDefaultManager.getUserDefault(key: .userEmail),
            gender: UserDefaults.standard.integer(forKey: "\(userDefaultData.gender)")
        )
        
        AF.request(api.url, method: .get, parameters: api.parameters, headers: api.headers).responseString { response in
            switch response.result {
            case.success(let data):
                print("success", data)
                print(response.response?.statusCode)
            case.failure(let error):
                print(error)
                print(response.response?.statusCode)
            }
        }
    }
}
