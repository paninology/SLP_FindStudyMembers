//
//  UserDefaultManager.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/15.
//

import Foundation

enum userDefaultData {
    case idToken
    case nickName
    case userEmail
    case gender
    case phoneNumber
    case FCMtoken
    case birthday
    case myCoordinate
    case isFirstUser //0: 첫사용 1: 기존사용자
}


struct UserDefaultManager { //파라미터로 리턴타입(이넘) 넣어서 하나로 합칠수 있을듯
    
    static func getUserDefault(key: userDefaultData) -> String {
        UserDefaults.standard.string(forKey: "\(key)") ?? ""
    }
    
    static func setUserDefault<T>(key: userDefaultData, value: T) {
        UserDefaults.standard.set(value, forKey: "\(key)")
    }
    
    static func getIntUserDefault(key: userDefaultData) ->Int {
        UserDefaults.standard.integer(forKey: "\(key)")
    }
}
