//
//  ProductEndPoint.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//



import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper



enum ProductEndPoint {
    
    case getProducts(start:Int?,rows:Int?)
    
}

extension ProductEndPoint : Router {
    
    var baseURL: String{
        switch self {
            
        default:
            return APIConstants.basePath
        }
    }
    
    var method : Alamofire.HTTPMethod {
        
        switch self {
            
        default:
            return .get
        }
    }
    
    
    var header : [String: String]{
        
        return [:]
    }
    
    var route : String  {
        
        switch self {
        case .getProducts(_): return APIConstants.product
            
            
            
        }
    }
    
    var parameters: OptionalDictionary {
        return format()
    }
    
    func format() -> OptionalDictionary {
        let filterModel = UserSingleton.shared.setFilters
        switch self {
            
        case .getProducts(let start,let rows):
            return Parameters.products.map(values: [filterModel?.searchString,filterModel?.minPrice,filterModel?.maxPrice,filterModel?.wholeSale,filterModel?.official,filterModel?.fShop,start,rows])
            
            
        }
    }
    
    func handle(data : Any?) -> AnyObject? {
        switch self {
        case .getProducts(_):
            let object = Mapper<BaseModel>().map(JSONObject: data)
            print(object?.toJSON() ?? "")
            return object
            
        }
        //return data as AnyObject?
    }
}



