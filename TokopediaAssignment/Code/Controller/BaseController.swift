//
//  BaseController.swift
//  TokopediaAssignment
//
//  Created by megha on 6/27/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseController: UIViewController {

    //MARK: -
    //MARK: -Variables
    let disposableBag = DisposeBag()
    
    //MARK: -
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionViewFlowLayout(minSpacing : CGFloat ,minItemSpacing: CGFloat,scrollDirection:UICollectionViewScrollDirection,height:CGFloat?,width:CGFloat?) -> UICollectionViewFlowLayout{
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = minSpacing
        layout.minimumInteritemSpacing = minItemSpacing
        layout.scrollDirection = scrollDirection
        layout.itemSize.height = /height
        layout.itemSize.width = /width
        
        
        return layout
        
    }

   

}
