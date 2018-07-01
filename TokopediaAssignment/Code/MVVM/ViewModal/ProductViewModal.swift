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
    let arrayProductDetail = Variable<[ProductDetail]>([])
    var start = 0
    var rows = 10
    var filterModel : Filter?
    var totalItems = 0
    
    
    ///Setting to default values
    func defaultTheVariables() {
        
        start = 0
        rows = 10
        totalItems = 0
        
        self.arrayProductDetail.value.removeAll()
    }
}


///WebService Hit
extension ProductViewModal{
    
    func productSearchAPI(){
        
        APIManager.shared.request(with: ProductEndPoint.getProducts(start: start, rows: rows), completion: { (response) in
            
            switch response {
                
            case .success(let responseValue ):
                guard let responses = responseValue as? BaseModel else {return}
                print(responses)
                self.totalItems = /(responses.header?.total_data)
                self.totalItems = /(responses.header?.total_data)
                self.arrayProductDetail.value += responses.data ?? []
                
            case.failure(_):break
                //self.makeToast(text: str, type: .error)
            }
            
        }, loader: arrayProductDetail.value.count == 0)
    }
    
    ///Pagination
    func pagination(row : Int) {
        
        if row == arrayProductDetail.value.count - 1 {
            if totalItems > arrayProductDetail.value.count {
                start = rows
                rows += 10
                self.productSearchAPI()
            }
        }
    }
    
    
}

