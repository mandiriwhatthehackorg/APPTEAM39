//
//  Restful.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class Restful {
    public static func runRequest(urlRequest : URLRequest, jsonValidation : ((JSON) -> (RestError?))? = nil, callback : @escaping (RestError?, JSON?) -> ()) -> DataRequest{
        let req = request(urlRequest).responseJSON { response in
            var json : JSON?
            var err : RestError?
            switch response.result {
            case .success(let value) :
                json = value as? JSON
            case .failure(let error) :
                // error as? NSError
                if let nserror = NSError(coder: error as! NSCoder)  {
                    if nserror.code == -1001{
                        err = .timeout
                    } else if nserror.code == 401 {
                        err = .unauthorized
                    } else {
                        err = .serverFailure(code: nserror.code, message: nserror.localizedDescription)
                    }
                    if nserror.code == -1009 {
                        err = .internetLost
                    }
                }
            }
            if let validator = jsonValidation, let jsonData = json, err == nil{
                if let error = validator(jsonData){
                    err = error
                }
            }
            
            callback(err, json)
        }
        
        return req
    }
}
