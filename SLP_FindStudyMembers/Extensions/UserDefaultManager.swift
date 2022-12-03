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
}


struct UserDefaultManager {
    
    static func getUserDefault(key: userDefaultData) -> String {
        UserDefaults.standard.string(forKey: "\(key)") ?? ""
    }
    
    static func setUserDefault<T>(key: userDefaultData, value: T) {
        UserDefaults.standard.set(value, forKey: "\(key)")
    }
    
}
