//
//  APIManager.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/14.
//

import Foundation

import Alamofire


class APIManager {
    
    static let share = APIManager()
    
    private init() {}
    
    func requestSignIn() {
//        let url = EndPoint.SeSACBaseURL + "/v1/" + URLSuffix.user.rawValue
        let api = SeSACStudyAPI.signIn(
            phoneNumber: UserDefaultManager.getUserDefault(key: .phoneNumber),
            FCMtoken: "dzjnejNDh0d0u1aLzfS547:APA91bFvQSjDVFC4-2IA0QQ08KqsEKwIoK2hFBZIfdyNLPd22PvgLD6YM_kyQgv0BIK-1zjltbbKYQTGK50Pn21bctsuEC46qo7RDkcImbzyZBe0-ffMqhFhL4DO5tbP0Ri_Wn-vRVF5",
            nick: UserDefaultManager.getUserDefault(key: .nickName),
            birth: UserDefaults.standard.string(forKey: "birthday")!,
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
