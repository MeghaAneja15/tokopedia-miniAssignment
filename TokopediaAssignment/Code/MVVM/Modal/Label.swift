//
//  Label.swift
//  TokopediaAssignment
//
//  Created by megha on 28/05/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import ObjectMapper

class Label : Mappable {
    
    var title : String?
    var color : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        title <- map["title"]
        color <- map["color"]
    }
    
}
