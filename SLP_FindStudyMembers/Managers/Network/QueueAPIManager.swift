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
    
    func requestQueue(lat: Double, long: Double, studyList: [String], completion: @escaping ((String)-> Void)) {
        let api = SeSACStudyAPI.queue(lat: lat, long: long, studyList: studyList)
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).response { response in
            
            switch response.result {
            case .success(let data):
                print("success", data)
//                completion(data)
            case .failure(let error):
                print("errrror", error)

            }
        }        
        
    }
    
    func requestSearch(lat: Double, long: Double, completion: @escaping ((SearchSeSAC)-> Void)) {
        let api = SeSACStudyAPI.search(lat: lat, long: long)

        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseDecodable(of: SearchSeSAC.self) { response in
            print(response.response)
            switch response.result {
                
            case .success(let data):
                print("success", data)
                completion(data)
            case .failure(let error):
                print("errrror", error)

            }
            
            
        }
    }
    
    func requestMyQueueState(completion: @escaping ((Int?,MyQueueState?) -> Void)) {
        let api = SeSACStudyAPI.myQueueState
        
        AF.request(api.url, method: .get, headers: api.headers).responseDecodable(of: MyQueueState.self) { response in
            
            switch response.result {
            case .success(let data):
                print("success", data)
                completion(response.response?.statusCode, data)
            case .failure(let error):
                print("errrror", error)
                completion(response.response?.statusCode, nil)

            }
        }
    }
    
    
}
