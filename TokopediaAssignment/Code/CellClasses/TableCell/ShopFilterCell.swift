//
//  ShopFilterCell.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ShopFilterCell: UITableViewCell {
    
    //MARK:-
    //MARK:- Outlets
    @IBOutlet weak var lblShopFilter: UILabel!
    @IBOutlet weak var btnSelection: UIButton!
    
    //MARK:-
    //MARK:- Variables
    private (set) var rx_reusableDisposeBag = DisposeBag()
    
    override func prepareForReuse() {
        self.btnSelection.setImage(#imageLiteral(resourceName: "baseline_check_box_outline_blank_black_24pt"), for: .normal)
        self.lblShopFilter.text = ConstantStrings.emptyString.rawValue
        rx_reusableDisposeBag = DisposeBag()
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
