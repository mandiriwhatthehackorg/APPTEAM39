//
//  BaseNetworkRequest.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper
import AlamofireObjectMapper

open class BaseNetworkRequest: NSObject{
    
    public override init() {
        super.init()
    }
    
    public func getEncoding(_ method: HTTPMethod) -> ParameterEncoding{
        if (method == .post || method == .put || method == .patch){
            return JSONEncoding.default
        }
        return URLEncoding.default
    }
    
    public func getHeaders(isJwt: Bool) -> HTTPHeaders {
        var authorization = "Basic ZWUzNmY1ZDMtNmZjMy00Y2M0LWEwMDUtMWM3ZjYzYWQ0ODFhOjM1M2I4MjcwLWFhYmMtNDFkMy05Yjk0LTNmM2Q1M2I3NTk2NQ=="
        if !isJwt {
            authorization = Preference.getString(key: BasePref.JWT)
        }
        let headers: HTTPHeaders = [
            "Content-Type":"application/x-www-form-urlencoded",
            "Accept": "application/json",
            "Authorization": authorization
        ]
        return headers
    }
    
    public func getParameters() -> Parameters {
        return [:]
    }
}
