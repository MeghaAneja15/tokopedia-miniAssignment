//
//  APIRoutes.swift
//  TokopediaAssignment
//
//  Created by megha on 04/01/17.
//  Copyright © 2017 Megha. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol Router {
    
    var route : String { get }
    var baseURL : String { get }
    var parameters : OptionalDictionary { get }
    var method : Alamofire.HTTPMethod { get }
    var header : [String: String] {get}
    //var encoding : ParameterEncoding { get }
    func handle(data : Any?) -> AnyObject?
}

extension Sequence where Iterator.Element == Keys {
    
    func map(values: [Any?]) -> OptionalDictionary {
        
        var params = [String : Any]()
        
        for (index,element) in zip(self,values) {
            params[index.rawValue] = element
        }
        return params
        
    }
}
