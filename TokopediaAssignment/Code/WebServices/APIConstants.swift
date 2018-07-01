//
//  APIConstants.swift
//  TokopediaAssignment
//
//  Created by megha on 04/01/17.
//  Copyright © 2017 Megha. All rights reserved.


import Foundation

internal struct APIConstants {
    
    //MARK:-
    //MARK:- Base Path
    static let basePath = "https://ace.tokopedia.com/search/v2.5/"
    
    //Products
    static let product = "product"
    
    //MARK:-
    //MARK:- Status Code
    static let statusCode = "statusCode"
    static let message = "message"
    static let data = "data"
    
}

enum Keys : String {
    
    
    
    
    //MARK:-
    //MARK:- Social Login Keys
    case searchString = "q"
    case minimumPrice = "pmin"
    case maximumPrice = "pmax"
    case wholesale = "wholesale"
    case official = "official"
    case fshop = "fshop"
    case start = "start"
    case rows = "rows"
}

enum Validate : String {
    
    case none
    case success = "0"
    case failure = "405"
    case wrongUrl = "404"
    case invalidAccessToken = "401"
    case wrongData = "400"
    case fbLogin = "3"
    
    func map(response message : String?) -> String? {
        
        switch self {
        case .success:
            return message
        case .failure :
            return message
        case .invalidAccessToken :
            return message
            
        default:
            return nil
        }
    }
}

enum Response {
    case success(AnyObject?)
    case failure(String?)
}

typealias OptionalDictionary = [String : Any]?

struct Parameters {
    
    //MARK:-
    //MARK:- Product Parameters
    
    static let products:[Keys] = [.searchString , .minimumPrice,.maximumPrice,.wholesale,.official,.fshop,.start,.rows]
    
}

