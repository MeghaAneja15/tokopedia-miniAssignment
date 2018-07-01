//
//  ProductDetail.swift
//  TokopediaAssignment
//
//  Created by megha on 28/05/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel : Mappable{
    
    var data : [ProductDetail]?
    var message : String?
    var statusCode :StatusModel?
    var header : headerValue?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map)
    {
        data <- map["data"]
        message <- map["message"]
        statusCode <- map["status"]
        header <- map["header"]
    }
}

class StatusModel : Mappable{
    

    var message : String?
    var error_code : Int?
    
    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map)
    {
        message <- map["message"]
        error_code <- map["error_code"]
        
    }
}


class headerValue:Mappable{
    
    var total_data : Int?
    var total_data_no_category : Int?

    required init?(map: Map){
        mapping(map: map)
    }
    
    func mapping(map: Map)
    {
        total_data <- map["total_data"]
        total_data_no_category <- map["total_data_no_category"]
        
    }
    
}

class ProductDetail : Mappable {
    
    var id :Int?
    var name :String?
    var uri :String?
    var image_uri :String?
    var image_uri_700 :String?
    var price :String?
    var price_range :String?
    var category_breadcrumb :String?
    var shop : ShopProduct?
    var condition :Int?
    var preorder :Int?
    var department_id :Int?
    var rating :Int?
    var is_featured :Int?
    var count_review :Int?
    var count_talk :Int?
    var count_sold :Int?
    var original_price :String?
    var discount_expired :String?
    var discount_start :Int?
    var discount_percentage :Int?
    var stock :Int?
    
    var wholesale_price : [WholesalePrice]?
    var labels : [Label]?
    var badges : [Badge]?
    
     init?(){}
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        
        id  <- map["id"]
        name <- map["name"]
        uri <- map["uri"]
        image_uri <- map["image_uri"]
        image_uri_700 <- map["image_uri_700"]
        price <- map["price"]
        price_range <- map["price_range"]
        category_breadcrumb <- map["category_breadcrumb"]
        shop <- map["shop"]
        condition <- map["condition"]
        preorder <- map["preorder"]
        department_id <- map["department_id"]
        rating <- map["rating"]
        is_featured <- map["is_featured"]
        count_review <- map["count_review"]
        count_talk <- map["count_talk"]
        count_sold <- map["count_sold"]
        discount_expired <- map["discount_expired"]
        discount_start <- map["discount_start"]
        discount_percentage <- map["discount_percentage"]
        stock <- map["stock"]
        wholesale_price <- map["wholesale_price"]
        labels <- map["labels"]
        badges <- map["badges"]

    }
}

