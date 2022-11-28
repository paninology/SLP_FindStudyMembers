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
    case search(lat: Double, long: Double)
}

extension SeSACStudyAPI {
    var url: URL {
        switch self {
        case .signIn, .logIn:
            return URL(string: "\(EndPoint.SeSACBaseURL)/v1/user")!
        case .search:
            return URL(string: "\(EndPoint.SeSACBaseURL)/v1/queue/search")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .signIn, .logIn, .search :
            return [
                "idtoken": UserDefaultManager.getUserDefault(key: .idToken),
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
        case .search(let lat, let long):
            return [
                "lat": lat,
                "long": long
            ]
        default:
            return ["":""]
        }
    }
   
    
}
