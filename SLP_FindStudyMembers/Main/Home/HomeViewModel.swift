//
//  HomeViewModel.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/23.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire


final class HomeViewModel {
    
    let suggestStudyKeword = PublishSubject<[String]>()
    
//    let enteredKeyword = PublishSubject<String>()
    
    var keywords:[String] = []
    
    var keyword = ""
    
    let disposebag = DisposeBag()
    
    func enterKeyword() {
        guard !keywords.contains(keyword) else { return }
        
        keywords.append(keyword )
        print(keyword, keywords)
        suggestStudyKeword.onNext(keywords)
//        enteredKeyword.bind { value in
//            self.keywords.append(value)
//            self.suggestStudyKeword.onNext(self.keywords)
//            print("vv",value)
//        }
//        .disposed(by: disposebag)
        
//        suggestStudyKeword.onNext( ["test"])

       
    }
    
    func requestNearbyUsers() {
//        let api = API
        
//        AF.request(<#T##convertible: URLConvertible##URLConvertible#>, method: <#T##HTTPMethod#>, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>, interceptor: <#T##RequestInterceptor?#>, requestModifier: <#T##Session.RequestModifier?##Session.RequestModifier?##(inout URLRequest) throws -> Void#>)
    }
    
}
