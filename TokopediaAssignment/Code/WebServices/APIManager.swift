//
//  APIManager.swift
//  TokopediaAssignment
//
//  Created by megha on 04/01/17.
//  Copyright © 2017 Megha. All rights reserved.
//


import Foundation
import ObjectMapper
import Alamofire
import SwiftyJSON

class APIManager : NSObject {
    
    typealias Completion = (Response) -> ()
    static let shared = APIManager()
    var object:AnyObject?
    private lazy var httpClient : HTTPClient = HTTPClient()
    
    //Post Request With Data
    func request(with api : Router , completion : @escaping Completion , loader:Bool )  {
        print("Parameters",api.parameters ?? "")
        if !Alamofire.NetworkReachabilityManager()!.isReachable {
            
            //  Alerts.shared.show(alert: Alert.oops.getLocalised(), message: "NoInternetConnection".localized, type: .info)
            return completion(Response.failure("NoInternetConnection"))
        }
        
        if loader {
            CommonFunction.sharedInstance.showLoader()
        }
        httpClient.postRequest(withApi: api, success: {[weak self] (data) in
            
            CommonFunction.sharedInstance.hideLoader()
            
            guard let response = data else {
                completion(Response.failure(.none))
                return
            }
            //let json = JSON(response)
            guard let json = Mapper<BaseModel>().map(JSONObject: response) else {return}
            print("Json response : " , json.toJSON() )
            
            if "\(String(describing: json.statusCode?.error_code))" == Validate.invalidAccessToken.rawValue{
                self?.tokenExpired()
                return
            }
            else if json.message == "Token should not be empty!"{
                return
                
            }else if /json.statusCode?.error_code?.toString == Validate.wrongData.rawValue{
               // self?.makeToast(text: "Please attact you paypal account", type: .error)
                return
                
            } else {
                let statusCode = /json.statusCode?.error_code?.toString
                let responseType = Validate(rawValue: /statusCode) ?? .failure
                if responseType == Validate.success{
                    
                    let object1 : AnyObject?
                    object1 = api.handle(data : data)
                    completion(Response.success(object1))
                    return
                }
                else{
                    completion(Response.failure(json.message)) }
                
                
            }}, failure: { (message) in
                
                CommonFunction.sharedInstance.hideLoader()
                if message.contains("JSON could not"){
                    completion(Response.failure("Internal server error"))
                }else{
                    completion(Response.failure(message))
                }
                
        })
    }
    
    func tokenExpired() {
        let nc = NotificationCenter.default
        nc.post(name:Notification.Name(rawValue:"CapCropLogout"),
                object: nil,
                userInfo: nil)
        
    }
    
    func isLoaderNeeded(api : Router) -> Bool{
        switch api.route {
            
        default: return true
        }
    }
    
}
