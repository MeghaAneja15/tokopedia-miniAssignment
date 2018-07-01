//
//  UIViewControllerExtension.swift
//  TokopediaAssignment
//
//  Created by megha on 29/06/18.
//  Copyright © 2018 Tokopedia. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func dismissToRoot() {
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    func popVC(animated : Bool = true) {
        _ = self.navigationController?.popViewController(animated: animated)
    }
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func push(_ vc: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    func present(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    
    var appDelegate : AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
}

extension UITableView {
    func registerXIB(_ nibName: String) {
        self.register(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
}

extension UICollectionView {
    func registerXIB(_ nibName: String) {
        self.register(UINib.init(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}

