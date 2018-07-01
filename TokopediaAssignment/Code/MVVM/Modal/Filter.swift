//
//  Filter.swift
//  TokopediaAssignment
//
//  Created by megha on 29/05/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import UIKit


struct Filter : Codable {
    var maxPrice : CGFloat?
    var minPrice : CGFloat?
    var lowerBound : CGFloat?
    var upperBound : CGFloat?
    var wholeSale : Bool?
    var official : Bool?
    var fShop : Int?
    var searchString : String?

}


