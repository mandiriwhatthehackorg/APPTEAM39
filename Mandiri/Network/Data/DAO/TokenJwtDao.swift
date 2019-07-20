//
//  TokenJwtDao.swift
//
//  Created by user on 20/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class TokenJwtDao: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kTokenJwtDaoJwtKey: String = "jwt"

  // MARK: Properties
  public var jwt: String?

  // MARK: ObjectMapper Initalizers
  /**
   Map a JSON object to this class using ObjectMapper
   - parameter map: A mapping from ObjectMapper
  */
    required public init?(map: Map){

  }

  /**
  Map a JSON object to this class using ObjectMapper
   - parameter map: A mapping from ObjectMapper
  */
  public func mapping(map: Map) {
    jwt <- map[kTokenJwtDaoJwtKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = jwt { dictionary[kTokenJwtDaoJwtKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.jwt = aDecoder.decodeObject(forKey: kTokenJwtDaoJwtKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(jwt, forKey: kTokenJwtDaoJwtKey)
  }

}
