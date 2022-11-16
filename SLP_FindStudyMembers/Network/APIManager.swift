//
//  APIManager.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/14.
//

import Foundation

import Alamofire
import FirebaseAuth
import Firebase


class APIManager {
    
    static let share = APIManager()
    
    private init() {}
    
    func requestSignIn( completion: @escaping (()->Void)) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let birthday = UserDefaults.standard.value(forKey: "birthday") as! Date
        
        let api = SeSACStudyAPI.signIn(
            phoneNumber: UserDefaultManager.getUserDefault(key: .phoneNumber),
            FCMtoken: "dzjnejNDh0d0u1aLzfS547:APA91bFvQSjDVFC4-2IA0QQ08KqsEKwIoK2hFBZIfdyNLPd22PvgLD6YM_kyQgv0BIK-1zjltbbKYQTGK50Pn21bctsuEC46qo7RDkcImbzyZBe0-ffMqhFhL4DO5tbP0Ri_Wn-vRVF5",
            nick: UserDefaultManager.getUserDefault(key: .nickName),
            birth: formatter.string(from: birthday),
            email: UserDefaultManager.getUserDefault(key: .userEmail),
            gender: UserDefaults.standard.integer(forKey: "\(userDefaultData.gender)")
        )

        refreshIDToken()
        
        AF.request(api.url, method: .get, parameters: api.parameters, headers: api.headers).responseString { response in

            switch response.result {
            case.success(let data):
                print("success", data)
                completion()
            case.failure(let error):
                print("error",error)
                print("status",response.response?.statusCode)
                if response.response?.statusCode == 406 { completion() }
            }
        }
    }
    
    func refreshIDToken() {
        let currentUser = Auth.auth().currentUser
//        let currentUser = FIRAuth.auth()?.currentUser
        currentUser?.getIDTokenForcingRefresh(true) { idToken, error in
          if let error = error {
            print("Refresh token failed")
            return;
          }
            UserDefaultManager.setUserDefault(key: .idToken, value: idToken)
            print("refreshed idtoken", idToken)
          // Send token to your backend via HTTPS
          // ...
        }
    }
}
