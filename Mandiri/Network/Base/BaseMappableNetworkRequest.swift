//
//  BaseMappableNetworkRequest.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper
import AlamofireObjectMapper

open class BaseMappableNetworkRequest<T: Mappable>: BaseNetworkRequest{
    
    public override init() {
        super.init()
    }
    
    public func getResponseRejectedReview(_ method: HTTPMethod ,url: String, params: Parameters) -> Observable<T>{
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   headers: [:])
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObject(type: T.self)
        }
        return observable
    }
    
    public func getResponseObject(_ method: HTTPMethod ,endpoint: String, params: Parameters, headers: HTTPHeaders) -> Observable<T>{
        let UrlFull = BaseUrl.url + endpoint
        let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(method),
                                                   headers: headers)
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObject(type: T.self)
        }
        return observable
    }
    
    public func uploadImage(_ image: Data ,endpoint: String, params: [String:String], headers: HTTPHeaders) -> Observable<T> {
        return Observable.create { observer in
            let UrlFull = BaseUrl.url + endpoint
            let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let url = URL(string: urlStr!)
            Alamofire.upload(
                multipartFormData: { formData in
                    formData.append( image , withName: "fileData", fileName: "image.jpeg", mimeType: "image/jpeg")
                    for (key, value) in params {
                        formData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    }
            },
                usingThreshold:UInt64.init(),
                to: url!,
                method: .post, headers: headers,
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            print("responseJson \(response.response?.statusCode)")
                            if let code = response.response?.statusCode , code >= 400 {
                                observer.onError(Event<Any>.error(ObjectMapError.ErrorCodeValue(code)) as! Error)
                            }else{
                                observer.onCompleted()
                            }
                        }
                    case .failure(let encodingError):
                        observer.onError(encodingError)
                    }
            })
            return Disposables.create()
        }
        
    }
    
    public func getResponseArray(_ method: HTTPMethod ,endpoint: String, params: Parameters, headers: HTTPHeaders) -> Observable<[T]>{
        let UrlFull = BaseUrl.url + endpoint
        let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(method),
                                                   headers: headers)
        let observable = alamofireRequest.flatMap{
            $0.rx_responseArray(type: T.self)
        }
        return observable
    }
    
    public func getResponseCRMObject(_ method: HTTPMethod ,endpoint: String, params: Parameters, headers: HTTPHeaders) -> Observable<T>{
        let UrlFull = BaseUrl.url + endpoint
        print("params: \(params), headers: \(headers), url: \(UrlFull)")
        let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(method),
                                                   headers: headers)
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObjectCRM(type: T.self)
        }
        return observable
    }
    
    public func getResponseCRMObjectArray(_ method: HTTPMethod ,endpoint: String, params: Parameters, headers: HTTPHeaders) -> Observable<[T]>{
        let UrlFull = BaseUrl.url + endpoint
        let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(method),
                                                   headers: headers)
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObjectCRMArray(type: T.self)
        }
        return observable
    }
    
    public func getResponseObjectArray(_ method: HTTPMethod ,endpoint: String, params: Parameters, headers: HTTPHeaders) -> Observable<[T]>{
        let UrlFull = BaseUrl.url + endpoint
        let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(method),
                                                   headers: headers)
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObjectCRMArray(type: T.self)
        }
        return observable
    }
    
    public func getResponseObjectMAR(_ method: HTTPMethod ,endpoint: String, params: Parameters, headers: HTTPHeaders) -> Observable<T>{
        let UrlFull = BaseUrl.url + endpoint
        let urlStr = UrlFull.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)
        let alamofireRequest = RxAlamofire.request(method,
                                                   url!,
                                                   parameters: params,
                                                   encoding: getEncoding(method),
                                                   headers: headers)
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObject(type: T.self)
        }
        return observable
    }
}
