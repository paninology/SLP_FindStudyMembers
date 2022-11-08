//
//  LogInViewModel.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/07.
//

import Foundation
import RxSwift
import RxCocoa


class LogInViewModel {
    
    let phoneNumber = PublishSubject<String>() //Int?? 인풋용
    
    let phoneNumForLabel = PublishSubject<String>() //아웃풋용
    
    let validataion = PublishSubject<Bool>()
    
    let disposeBag = DisposeBag()
    
    
    func convertPhoneNum() {
        
        phoneNumber
            .withUnretained(self)
            .subscribe { (vc,value) in
                print("phoen",value)
                vc.phoneNumForLabel.onNext(vc.addHyphen(num: value))
        }
            .disposed(by: disposeBag)
    }
    
    func checkValidation() {

//        phoneNumber
//            .map { $0.replacingOccurrences(of: "-", with: "") }
//            .map { $0.count == 10 || $0.count == 11 }
//            .withUnretained(self)
//            .bind(to: validataion)
//            .disposed(by: disposeBag)
    }
    
    func addHyphen(num: String)-> String {
        let res = num.replacingOccurrences(of: "-", with: "")
        
        return res.count == 10 ? num.applyPatternOnNumbers(pattern: "###-###-####", replacementCharacter: "#") : num.applyPatternOnNumbers(pattern: "###-####-####", replacementCharacter: "#")
    }
    
    
}
