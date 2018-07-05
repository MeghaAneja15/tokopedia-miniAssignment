//
//  FilterVC.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import UIKit
import RangeSeekSlider
import RxSwift
import RxCocoa

//MARK:- Button Enums
enum FilterBtnActions: Int{
    case Cancel = 0
    case Reset = 1
    case ShopType = 2
    case Apply = 3
}

protocol ChangeFilter : class{
    
    func changeFilterData()
}

class FilterVC: BaseController {
    
    //MARK: -
    //MARK: - Outlets
    @IBOutlet var filterBtnOutlets: [UIButton]!
    @IBOutlet weak var rangeSlider: RangeSeekSlider!
    @IBOutlet weak var lblMinPrice: UILabel!
    @IBOutlet weak var lblMaxPrice: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var switchWholesale: UISwitch!
    @IBOutlet weak var constraintCollectionviewHeight: NSLayoutConstraint!
    
    //MARK: -
    //MARK: - Variables
    let viewModal = FilterViewModel()
    weak var delegate : ChangeFilter?
    
    //MARK: -
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }


//MARK: -
//MARK: - UICollectionView DataSource, Delegate
    
    func configureCollectionView(){
        
        self.viewModal.arrayShopFilter.asObservable().bind(to: collection.rx.items(cellIdentifier: CellIdentifiers.filterShopTypeCell.rawValue, cellType: FilterShopTypeCell.self)) { row ,model,cell in
            
            cell.shopFilter = model
            
            cell.btnRemoveShopType.rx.tap.subscribe(onNext:{[weak self] _ in
                self?.viewModal.tapDeleteShopType(at: row)
                
                self?.constraintCollectionviewHeight.constant = /(self?.viewModal.arrayShopFilter.value.count) == 0 ? 0.0 : Height.filterCollectionview
                
            }).disposed(by: cell.rx_reusableDisposeBag)
            
            
            }.disposed(by: disposableBag)
        
    }
    
//MARK: -
//MARK: - Custom Methods

    func initialSetup() {
        self.viewModal.filterModel = UserSingleton.shared.setFilters
        self.viewModal.arrayShopFilter.accept((UserSingleton.shared.setFilters?.shopFilter) ?? [])

        bindingButtons()
        setupCollectionview()
        configureCollectionView()
        setFilterValues()
        setupRangeFilter()
    }
    
    ///Sretting Values on filter
    func setFilterValues() {
        
        self.lblMaxPrice.text = /String(describing: /self.viewModal.filterModel?.maxPrice)
        self.lblMinPrice.text = /String(describing: /self.viewModal.filterModel?.minPrice)
        
        self.switchWholesale.isOn = /(self.viewModal.filterModel?.wholeSale)
        
        self.constraintCollectionviewHeight.constant = /(self.viewModal.arrayShopFilter.value.count) == 0 ? 0.0 : Height.filterCollectionview
        
    }
    
    ///Sretting Range Seek Slider on filter
    func setupRangeFilter() {
        
        self.rangeSlider.delegate = self
        self.rangeSlider.handleBorderWidth = 1.0
        self.rangeSlider.handleBorderColor = UIColor(netHex: 0x5CB54B)
        self.rangeSlider.handleDiameter = 24.0
        
        self.rangeSlider.minValue = /self.viewModal.filterModel?.lowerBound
        self.rangeSlider.maxValue = /(self.viewModal.filterModel?.upperBound)
        
        self.rangeSlider.selectedMinValue = /self.viewModal.filterModel?.minPrice
        self.rangeSlider.selectedMaxValue = /self.viewModal.filterModel?.maxPrice
    }
    
    ///Setting Collection View
    func setupCollectionview() {
        
         collection.collectionViewLayout = self.collectionViewFlowLayout(height:  self.collection.bounds.height - 8.0, width: ScreenSize.screenWidth/2 - 12.0)
        
        
    }
    
//MARK:-
//MARK:- Button Bindings
    
    func bindingButtons() {
        bindBtn(value: .Cancel)
        bindBtn(value: .Reset)
        bindBtn(value: .ShopType)
        bindBtn(value: .Apply)
    }
    
    func bindBtn(value : FilterBtnActions){
        
        filterBtnOutlets[value.rawValue].rx.tap.asDriver().drive(onNext: {
            switch value{
                
            case .Cancel:
                self.dismissVC()
                
            case .Reset:
                self.viewModal.filterModel = self.viewModal.defaultFilterModel
                UserSingleton.shared.setFilters = self.viewModal.filterModel
                self.setFilterValues()
                self.setupRangeFilter()
                self.rangeSlider.layoutSubviews()
                
            case .ShopType:
                guard let vc = R.storyboard.main.shopFilterVC() else {return}
                vc.delegate = self
                vc.viewModal.arraySelectedShopFilter = self.viewModal.arrayShopFilter.value
                self.present(vc)
                
            case .Apply:
                UserSingleton.shared.setFilters = self.viewModal.filterModel
                self.dismiss(animated: true, completion: {
                    self.delegate?.changeFilterData()
                    
                })
                
            }
        }).disposed(by: disposableBag)
        
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        
        self.viewModal.filterModel?.wholeSale = /((sender as? UISwitch)?.isOn)
    }
}

//MARK:-
//MARK:- Delegates
extension FilterVC : ChangeShopFilter {
    func changeShopFilterData(shopFilter: [ShopFilter]?) {
        self.viewModal.arrayShopFilter.accept(shopFilter ?? [])
        self.viewModal.filterModel?.shopFilter = shopFilter ?? []
        self.setFilterValues()
    }
    
}

// MARK: - RangeSeekSliderDelegate
extension FilterVC: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        self.viewModal.filterModel?.maxPrice = maxValue
        self.viewModal.filterModel?.minPrice = minValue
        
        self.setFilterValues()
    }
}

