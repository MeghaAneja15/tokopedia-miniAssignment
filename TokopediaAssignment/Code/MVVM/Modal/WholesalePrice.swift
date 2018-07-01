//
//  WholesalePrice.swift
//  TokopediaAssignment
//
//  Created by megha on 28/05/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import ObjectMapper


class WholesalePrice : Mappable {
    
    var count_min :Int?
    var count_max :Int?
    var price :String?
 
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        
        count_min  <- map["count_min"]
        count_max <- map["count_max"]
        price <- map["price"]
    }
}
