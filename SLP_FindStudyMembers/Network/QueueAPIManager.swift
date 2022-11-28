//
//  QueueAPIManager.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/28.
//

import Foundation

import Alamofire

class QueueAPIManager {
    
    static let share = QueueAPIManager()
    
    private init() {}
    
    func requestSearch(lat: Double, long: Double, completion: @escaping (()-> Void)) {
        let api = SeSACStudyAPI.search(lat: lat, long: long)
        print(api)
        print(api.headers)
        print(api.parameters)
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseDecodable(of: SearchSeSAC.self) { response in
            print(response.response)
            switch response.result {
                
            case .success(let data):
                print("success", data)
            case .failure(let error):
                print("errrror", error)
            }
            completion()
            
        }
    }
    
    
}
