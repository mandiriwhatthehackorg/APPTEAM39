//
//  BaseService.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class TokenService: BaseMappableNetworkRequest<TokenJwtDao>{
    public func getTokenJwt() -> Observable<TokenJwtDao>{
        return getResponseObject(.get, endpoint:"gateway/token", params: [:], headers: getHeaders(isJwt: true))
    }
}
