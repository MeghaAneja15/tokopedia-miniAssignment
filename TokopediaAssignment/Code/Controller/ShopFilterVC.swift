//
//  ShopFilterVC.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//



import UIKit
import RxCocoa
import RxSwift

protocol ChangeShopFilter : class{
    
    func changeShopFilterData(shopFilter:[ShopFilter]?)
}

//MARK:- Shop Filters
enum ShopFilterBtnActions: Int{
    case Cancel = 0
    case Reset = 1
    case Apply = 2
}

class ShopFilterVC: BaseController {

    //MARK:-
    //MARK: - Outlets
    @IBOutlet weak var table: UITableView!
    @IBOutlet var filterBtnOutlets: [UIButton]!
    
    //MARK:-
    //MARK: - Variables
    let viewModal = ShopFilterViewModel()
    weak var delegate : ChangeShopFilter?

    
    //MARK: - View delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

//MARK: -
//MARK: - Custom Methods
    
    func initialSetup() {
        self.viewModal.setingShopFilter()
        configureCollectionView()
        bindingButtons()
    }
//MARK: -
//MARK: - IBAction
    
    func bindingButtons() {
        bindBtn(value: .Cancel)
        bindBtn(value: .Reset)
        bindBtn(value: .Apply)
    }
    
    func bindBtn(value : ShopFilterBtnActions){
        
         filterBtnOutlets[value.rawValue].rx.tap.asDriver().drive(onNext: {
            switch value{
                
            case .Cancel:
                self.dismissVC()
                
            case .Reset:
                if self.viewModal.arraySelectedShopFilter.count > 0 {
                    self.viewModal.arraySelectedShopFilter.removeAll()
                    self.table.reloadData()
                }
                
            case .Apply:
                self.dismiss(animated: true) {
                    self.delegate?.changeShopFilterData(shopFilter: self.viewModal.arraySelectedShopFilter)
                }
                
            }
        }).disposed(by: disposableBag)
        
    }
    
//MARK: -
//MARK:- TableView DataSource

    
    func configureCollectionView(){
        
        self.viewModal.arrayShopFilter.asObservable().bind(to: table.rx.items(cellIdentifier: CellIdentifiers.shopFilterCell.rawValue, cellType: ShopFilterCell.self)) { row ,model,cell in
            
            let btnSelectionImage = self.viewModal.arraySelectedShopFilter.contains(where: { $0.id == /(model.id) }) ? #imageLiteral(resourceName: "baseline_check_box_black_24pt") : #imageLiteral(resourceName: "baseline_check_box_outline_blank_black_24pt")
            
            cell.btnSelection.setImage(btnSelectionImage, for: UIControlState.normal)
            cell.lblShopFilter.text = model.name
            cell.btnSelection.rx.tap.subscribe(onNext:{[weak self] _ in
                
                if let selectedIndex = self?.viewModal.arraySelectedShopFilter.index(where: { $0.id == /(model.id) }) {
                    
                    self?.viewModal.arraySelectedShopFilter.remove(at: selectedIndex)
                }
                else {
                    
                    self?.viewModal.arraySelectedShopFilter.append(model)
                }
                self?.table.reloadData()
                
            }).disposed(by: cell.rx_reusableDisposeBag)
            
            }.disposed(by: disposableBag)
    }
}



