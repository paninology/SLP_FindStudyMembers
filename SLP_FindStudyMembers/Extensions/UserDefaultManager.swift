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
}


struct UserDefaultManager {
    
    //UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
    // UserDefaults.standard.set(idToken, forKey: "idToken")
    
//    static var idToken: String {
//        get {
//            UserDefaults.standard.string(forKey: "idToken") ?? "idToken을 찾을수 없습니다."
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: "idToken")
//        }
//    }
//
//    static var nickName: String {
//        get {
//            UserDefaults.standard.string(forKey: "nickName") ?? "nickName을 찾을수 없습니다."
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: "nickName")
//        }
//    }
    
    static func getUserDefault(key: userDefaultData) -> String {
        UserDefaults.standard.string(forKey: "\(key)") ?? ""
    }
    
    static func setUserDefault<T>(key: userDefaultData, value: T) {
        UserDefaults.standard.set(value, forKey: "\(key)")
    }
    
}
