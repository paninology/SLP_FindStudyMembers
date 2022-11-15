//
//  EndPoint.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/15.
//

import Foundation

import Alamofire

enum SeSACStudyAPI {
    case signIn(phoneNumber: String, FCMtoken: String, nick: String, birth: String, email: String, gender: Int)
    case logIn
}

extension SeSACStudyAPI {
    var url: URL {
        switch self {
        case .signIn, .logIn:
            return URL(string: "http://api.sesac.co.kr:1207/v1/user")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signIn, .logIn:
            print(UserDefaults.standard.string(forKey: "idToken"))
            return [
                "Authorizaion": "Bearer \(UserDefaults.standard.string(forKey: "idToken")!)",
                "Content-Type": "application/x-www-form-urlencoded"
            ]
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .signIn(let phoneNumber, let FCMtoken, let nick, let birth, let email, let gender):
            return [
                "phoneNumber" : phoneNumber,
                "FCMtoken" :FCMtoken,
                "nick": nick,
                "birth": birth,
                "email": email,
                "gender" : gender
            ]
        default:
            return ["":""]
        }
    }
   
    
}