//
//  FilterShopTypeCell.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class FilterShopTypeCell : UICollectionViewCell {
    
    // IBOutlets
    @IBOutlet var lblShopType: UILabel!
    @IBOutlet var viewShopType: UIView!
    @IBOutlet var btnRemoveShopType: UIButton!
    @IBOutlet weak var constraintBtnRemoveWidth: NSLayoutConstraint!
    
    // Variables
    private (set) var rx_reusableDisposeBag = DisposeBag()
    
    override func prepareForReuse() {
        rx_reusableDisposeBag = DisposeBag()
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // initial setup
        self.viewShopType.layer.masksToBounds = false
        self.btnRemoveShopType.layer.masksToBounds = true
        
        constraintBtnRemoveWidth.constant = self.viewShopType.frame.size.height - 16.0
    }
    
    var shopFilter : ShopFilter? {
        didSet {
            self.lblShopType.text = shopFilter?.name
        }
    }
}



