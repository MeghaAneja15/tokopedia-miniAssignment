
//
//  FilterViewModel.swift
//  TokopediaAssignment
//
//  Created by megha on 6/1/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

///It is responsible for performing buisness logic of FilterViewController
class FilterViewModel{
    
    let disposableBag = DisposeBag()
    var filterModel : Filter?
    
    var defaultFilterModel = Filter(maxPrice:100000.0,minPrice:10000.0,lowerBound:10000.0,upperBound:100000.0,wholeSale:false,official:true,fShop:2,searchString:ConstantStrings.searchString.rawValue)
    
    var arrayShopFilter = Variable<[ShopFilter]>([ShopFilter(name: ConstantStrings.goldMerchant.rawValue, id: ConstantStrings.idGold.rawValue), ShopFilter(name: ConstantStrings.officialStore.rawValue, id: ConstantStrings.idOfficial.rawValue)])

    
    ///Deleting the filter on cell tap
    func tapDeleteShopType(at row : Int) {
    
        if(row >= arrayShopFilter.value.count){
            return
        }
        
        self.arrayShopFilter.value.remove(at: row)
    }
    
}
