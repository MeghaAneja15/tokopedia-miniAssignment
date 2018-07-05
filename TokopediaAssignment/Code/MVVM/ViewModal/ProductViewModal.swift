//
//  ProductViewModal.swift
//  TokopediaAssignment
//
//  Created by megha on 6/27/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class ProductViewModal{
    
    let disposableBag = DisposeBag()
    let arrayProductDetail = BehaviorRelay<[ProductDetail]>(value: [])
    var start = 0
    var rows = 10
    var filterModel : Filter?
    var totalItems = 0
    
    
    //Setting to default values
    func defaultTheVariables() {
        
        start = 0
        rows = 10
        totalItems = 0
        
        self.arrayProductDetail.accept([])
    }
}


///WebService Hit
extension ProductViewModal{
    
    
    func productSearchAPI(){
        
        APIManager.shared.request(with: ProductEndPoint.getProducts(start: start, rows: rows), isLoaderNeeded: self.arrayProductDetail.value.count == 0).subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext:{ respone in
                
                guard let response = respone as? BaseModel else{return}
                let statusCode = StatusCode(rawValue: /response.statusCode?.error_code) ?? .failure
                switch statusCode{
                    
                case .success :
                    
                    self.totalItems = /(response.header?.total_data)
                    self.totalItems = /(response.header?.total_data)
                    self.arrayProductDetail.accept(self.arrayProductDetail.value + (response.data ?? []) )
                    
                case .failure:break
                UIApplication.shared.keyWindow?.rootViewController?.makeToast(text:  ConstantStrings.somethingWentWrong.rawValue, type: .error)
                    
                }
                
            }).disposed(by: disposableBag)
        
    }
    
    ///Pagination
    func pagination(row : Int) {
        
        if row == arrayProductDetail.value.count - 4 {
            if totalItems > arrayProductDetail.value.count {
                start = rows
                rows += 10
                self.productSearchAPI()
                
            }
        }
    }
    
    
}

