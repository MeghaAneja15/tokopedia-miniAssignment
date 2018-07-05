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
import RxSwift
import RxCocoa
import RxAlamofire

enum StatusCode : Int {
    case success = 0
    case failure = 1
}

class APIManager : NSObject {
    
    typealias Completion = (Response) -> ()
    static let shared = APIManager()
    var object:AnyObject?
   // private lazy var httpClient : HTTPClient = HTTPClient()
    let disposableBag = DisposeBag()
    
    func request(with api : Router,isLoaderNeeded:Bool) -> Observable<Any> {
        if isLoaderNeeded {
            CommonFunction.sharedInstance.showLoader()
        }
        return Observable<Any>.create { (observer) -> Disposable in
           
            let task =  RxAlamofire.requestJSON(api.method,api.baseURL + api.route , parameters: api.parameters, encoding: URLEncoding.default, headers: self.headerNeeded(api: api) ? api.header : nil).debug().subscribe(onNext: { (r,data) in
                
                
                guard let json = Mapper<BaseModel>().map(JSONObject: data) else {return}
                observer.onNext(json)
                
                if isLoaderNeeded {
                    CommonFunction.sharedInstance.hideLoader()
                }
                
            }, onError: { (error) in
                if isLoaderNeeded {
                    CommonFunction.sharedInstance.hideLoader()
                }
                self.makeToast(text: ConstantStrings.somethingWentWrong.rawValue, type: .error)

                observer.onError(error)
            }, onCompleted: {
                if isLoaderNeeded {
                    CommonFunction.sharedInstance.hideLoader()
                }
                observer.onCompleted()
            }, onDisposed: {
                
            })
            return task
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
