//
//  Badge.swift
//  TokopediaAssignment
//
//  Created by megha on 28/05/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import ObjectMapper

class Badge : Mappable {
    
    var title : String?
    var image_url : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        title <- map["title"]
        image_url <- map["image_url"]
    }
    
}
