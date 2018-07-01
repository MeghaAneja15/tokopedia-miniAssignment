//
//  HTTPClient.swift
//  TokopediaAssignment
//
//  Created by megha on 04/01/17.
//  Copyright © 2017 Megha. All rights reserved.
//

import Foundation
import Alamofire

typealias HttpClientSuccess = (Any?) -> ()
typealias HttpClientFailure = (String) -> ()

class HTTPClient {
    
    func JSONObjectWithData(data: NSData) -> Any? {
        do { return try JSONSerialization.jsonObject(with: data as Data, options: []) }
        catch { return .none }
    }
    
    
    func postRequest(withApi api : Router  , success : @escaping HttpClientSuccess , failure : @escaping HttpClientFailure ){
        
        let params = api.parameters

        
        //Here I can differentiate betwen image and user
        let fullPath = api.baseURL + api.route
        let method = api.method
        print(fullPath)
        print(params ?? "No params")
        Alamofire.request(fullPath, method: method, parameters: params, encoding: URLEncoding.default, headers: headerNeeded(api: api) ? api.header : nil).responseJSON { (response) in
            print("$$$$$$$$$$$$$$$$$$$")
            print(response)
            switch response.result {
            case .success(let data):
                debugPrint("========HTTP Client Success Data======")
                success(data)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
    
    //MARK : - get Header
    func headerNeeded(api : Router) -> Bool{
        
        switch api.route {
            
        //MARK:- API's that don't need headers            
        default:
            return false
        }
    }

}
