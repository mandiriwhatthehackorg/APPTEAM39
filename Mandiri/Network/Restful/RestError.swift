//
//  RestError.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation
public enum RestError : Equatable{
    case timeout
    case serverFailure(code : Int, message : String)
    case unauthorized
    case internetLost
    
    func order() -> Int{
        switch self{
        case .timeout :
            return 2
        case .serverFailure(let code, _) :
            return code
        case .unauthorized :
            return 3
        case .internetLost:
            return 4
        }
    }
}

public func ==(left: RestError, right: RestError) -> Bool{
    return left.order() == right.order()
}
