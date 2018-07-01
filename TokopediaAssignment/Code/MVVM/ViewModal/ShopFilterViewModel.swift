
//
//  ShopFilter.swift
//  TokopediaAssignment
//
//  Created by megha on 6/1/18.
//  Copyright © 2018 Megha. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

///It is responsible for performing buisness logic of ShopFilterViewController
class ShopFilterViewModel{
    
    let disposableBag = DisposeBag()
    
    var arraySelectedShopFilter = [ShopFilter]()

    var arrayShopFilter = Variable<[ShopFilter]>([])
    
    ///Setting ShopFilter Values
    func setingShopFilter() {
        
        self.arrayShopFilter.value = [ShopFilter(name: ConstantStrings.goldMerchant.rawValue, id: ConstantStrings.idGold.rawValue), ShopFilter(name: ConstantStrings.officialStore.rawValue, id: ConstantStrings.idOfficial.rawValue)]
        
    }
    
}
