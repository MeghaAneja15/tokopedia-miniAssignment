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

extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
     }
    
}
