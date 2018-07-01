
//
//  UnWrap.swift
//  TokopediaAssignment
//
//  Created by megha on 1/3/18.
//  Copyright © 2018 Megha. All rights reserved.
//


//MARK:- MODULES
import Foundation
import UIKit


typealias EmptyBlock = () -> ()

//MARK:- PROTOCOL
protocol OptionalType { init() }


//MARK:- EXTENSIONS
extension String: OptionalType {}
extension Int: OptionalType {}
extension Double: OptionalType {}
extension Bool: OptionalType {}
extension Float: OptionalType {}
extension CGFloat: OptionalType {}
extension CGRect: OptionalType {}
extension UIView: OptionalType {}
extension UIViewController: OptionalType {}
extension NSAttributedString: OptionalType {}
extension Date: OptionalType {}
extension Data: OptionalType {}



prefix operator /

//unwrapping values
prefix func /<T: OptionalType>( value: T?) -> T {
    guard let validValue = value else { return T() }
    return validValue
}
