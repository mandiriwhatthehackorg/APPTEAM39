//
//  AlamofireDataRequestExtensions.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

/**
 *
 * Helper extension to integrate RxSwift with Alamofire
 *
 */
public typealias JSON = [String : Any]
public let ParsingErrorCode: Int = 555
public let UnAuthorized: Int = 401
public let RequiredParameter: Int = 400
public let ResponseNil: Int = 555

public enum ObjectMapError: Error{
    case ErrorCodeValue(Int)
}

public enum ObjectMapErrorCRM<T>: Error {
    case ErrorCodeValue(T)
}

public struct ResponseMapError {
    public static func result(error: Error) -> Int{
        let err: ObjectMapError = error as! ObjectMapError
        switch err {
        case .ErrorCodeValue(400):
            return RequiredParameter
        case .ErrorCodeValue(401):
            return UnAuthorized
        case .ErrorCodeValue(555):
            return ResponseNil
        case .ErrorCodeValue(_):
            return ParsingErrorCode
        }
    }
}

public extension DataRequest{
    
    func processMap<N>(mapObject:@escaping (AnyObject)->N?) -> Observable<N>{
        
        return Observable.create{ (observer) -> Disposable in
            self.responseJSON(completionHandler: { (response : DataResponse<Any>) in
                print("responseJSON processMap : response \(String(describing: response.response)) result: \(response.result)")
                switch response.result {
                case .success :
                    guard let o = mapObject(response.result.value! as AnyObject) else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                        return
                    }
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.next(o))
                    }
                case .failure :
                    
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                    }
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    func processMapCRM<N>(mapObject:@escaping (AnyObject)->N?) -> Observable<N>{
        
        return Observable.create{ (observer) -> Disposable in
            self.responseJSON(completionHandler: { (response : DataResponse<Any>) in
                print("responseJSON processMap : response \(String(describing: response.response)) result: \(response.result)")
                switch response.result {
                case .success :
                    guard let o = mapObject(response.result.value! as AnyObject) else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                        return
                    }
                    
                    if let code = response.response?.statusCode , code > 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.next(o))
                    }
                case .failure :
                    
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                    }
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    func rx_responseArray<T:Mappable>(type:T.Type) -> Observable<[T]>{
        return self.processMap(mapObject: { (json) in
            if let json = json as? [JSON]{
                return Mapper<T>().mapArray(JSONArray: json)
            }else{
                return  Mapper<T>().mapArray(JSONArray: [])
            }
        })
    }
    
    func rx_responseObject<T:Mappable>(type:T.Type) -> Observable<T>{
        return self.processMap(mapObject: { (json) in
            if let json = json as? [String : Any] {
                print("JSON \(json)")
                return Mapper<T>().map(JSON: json)
            }else{
                return Mapper<T>().map(JSON: [:])
            }
        })
    }
    
    func rx_responseObjectCRM<T:Mappable>(type:T.Type) -> Observable<T>{
        return self.processMapCRM(mapObject: { (json) in
            print("JSON \(json)")
            if let json = json as? [String : Any] {
                return Mapper<T>().map(JSON: json)
            }else{
                return Mapper<T>().map(JSON: [:])
            }
        })
    }
    
    func rx_responseObjectCRMArray<T:Mappable>(type:T.Type) -> Observable<[T]>{
        return self.processMapCRM(mapObject: { (json) in
            print("JSON \(json)")
            if let json = json as? [[String : Any]] {
                return Mapper<T>().mapArray(JSONArray: json)
            }else{
                return Mapper<T>().mapArray(JSONArray: [[:]])
            }
        })
    }
    
    func rx_responseString() -> Observable<String>{
        return Observable.create{ (observer) -> Disposable in
            
            self.responseString(completionHandler: { response in
                switch response.result {
                    
                case .success :
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.next(response.result.value ?? ""))
                    }
                case .failure :
                    if let code = response.response?.statusCode , code >= 400 {
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(code)))
                    }else{
                        observer.on(Event.error(ObjectMapError.ErrorCodeValue(ParsingErrorCode)))
                    }
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
}
