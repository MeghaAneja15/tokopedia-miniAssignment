//
//  UserSingleton.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import Foundation
import ObjectMapper

class UserSingleton:NSObject{
    
    static let shared = UserSingleton()
    
    var setFilters : Filter? {
        set {
            guard let value = newValue else {
                UserDefaults.standard.removeObject(forKey: "Filter")
                return
            }
            if let encoded = try? JSONEncoder().encode(value) {
                UserDefaults.standard.set(encoded, forKey: "Filter")
            }
            
        }
        get {
            if let filterData = UserDefaults.standard.data(forKey: "Filter"),
                let filter = try? JSONDecoder().decode(Filter.self, from: filterData) {
                return (filter)
            }else {
            return Filter(maxPrice:100000.0,minPrice:10000.0,lowerBound:10000.0,upperBound:100000.0,wholeSale:false,official:true,fShop:2,searchString:ConstantStrings.searchString.rawValue, shopFilter: [ShopFilter(name: ConstantStrings.goldMerchant.rawValue, id: ConstantStrings.idGold.rawValue), ShopFilter(name: ConstantStrings.officialStore.rawValue, id: ConstantStrings.idOfficial.rawValue)])
        }
        }
    }
    
}



