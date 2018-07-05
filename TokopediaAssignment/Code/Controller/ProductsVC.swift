//
//  ProductsVC.swift
//  TokopediaAssignment
//
//  Created by megha on 6/27/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit

class ProductsVC: BaseController {
    
    //MARK: -
    //MARK: - OUTLETS
    @IBOutlet var collection: UICollectionView!
    @IBOutlet var btnFilter: UIButton!
    
    //MARK: -Variables
    var viewModal = ProductViewModal()
    
    //MARK: -
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
//MARK: -
//MARK: - Custom Methods
    
    func initialSetup(){
        
        configureCollectionView()
        buttonBinding()
        self.viewModal.productSearchAPI()
        
    }
    
    func configureCollectionView(){
        
        let layout = self.collectionViewFlowLayout( height: ScreenSize.screenHeight/2 - 16.0, width: ScreenSize.screenWidth/2 - 16.0)
        
        collection.collectionViewLayout = layout
        
        self.viewModal.arrayProductDetail.asObservable().bind(to: collection.rx.items(cellIdentifier: CellIdentifiers.productCell.rawValue, cellType: ProductCell.self)) { row ,model,cell in
            
            cell.product = model
            self.viewModal.pagination(row: row)
            }.disposed(by: disposableBag)
    }
    
    func buttonBinding(){
        
        btnFilter.rx.tap.asDriver().drive(onNext: {
            guard let vc = R.storyboard.main.filterVC() else { return }
            vc.delegate = self
            self.present(vc)
        }).disposed(by: disposableBag)
        
    }
}
//MARK:-
//MARK:- Delegates
extension ProductsVC : ChangeFilter {
    
    func changeFilterData(){
        self.viewModal.defaultTheVariables()
        self.viewModal.productSearchAPI()
        
    }
}

