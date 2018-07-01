//
//  ShopProduct.swift
//  Tokopedia_Sample
//
//  Created by megha on 28/05/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import ObjectMapper


class ShopProduct : Mappable {
    
    var id :Int?
    var name :String?
    var uri :String?
    var is_gold : Int?
    var rating : Int?
    var location :String?
    var reputation_image_uri :String?
    var shop_lucky :String?
    var city :String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        
        id  <- map["id"]
        name <- map["name"]
        uri <- map["uri"]
        is_gold <- map["is_gold"]
        rating <- map["rating"]
        location <- map["location"]
        reputation_image_uri <- map["reputation_image_uri"]
        shop_lucky <- map["shop_lucky"]
        city <- map["city"]
        
    }
}




