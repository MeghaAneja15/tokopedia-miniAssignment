//
//  ProductCell.swift
//  TokopediaAssignment
//
//  Created by megha on 6/27/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblProductName: UILabel!
    @IBOutlet var imgProduct: UIImageView!
    
    override func prepareForReuse() {
        
        self.lblPrice.text = ConstantStrings.emptyString.rawValue
        self.lblProductName.text = ConstantStrings.emptyString.rawValue
    }
    
    override func awakeFromNib() {
    }
    
    var product : ProductDetail? {
        didSet {
            self.lblPrice.text = product?.price
            self.lblProductName.text = product?.name
            self.imgProduct.kf.indicatorType = .activity
            self.imgProduct.setImage(/product?.image_uri, placeHolder: nil)

        }
    }
    
    
}
