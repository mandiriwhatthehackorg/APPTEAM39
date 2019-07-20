//
//  Preference.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import Foundation

public struct Preference {
    
    static let pref = UserDefaults.standard
    
    public static func commit(){
        pref.synchronize()
    }
    
    public static func remove(key:String) {
        pref.removeObject(forKey: key)
    }
    
    public static func saveObject(key:String ,value:AnyObject){
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        pref.set(data, forKey: key)
        commit()
    }
    
    public static func saveBool(key:String,value:Bool){
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveDouble(key:String,value:Double){
        pref.set(value, forKey: key)
        commit()
    }
    public static func saveInt(key:String,value:Int) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveString(key:String,value:String) {
        pref.set(value, forKey: key)
        commit()
    }
    
    public static func saveObjectEncodable<T: Encodable>(dataModel: T, key: String){
        pref.set(try? PropertyListEncoder().encode(dataModel), forKey: key)
        commit()
    }
    
    public static func getObjectDecodable<T: Decodable>(key: String)-> T? {
        if let data = pref.value(forKey: key) as? Data {
            let obj = try? PropertyListDecoder().decode(T.self, from: data)
            return obj
        }
        return nil
    }
    
    public static func getObject(key:String)->AnyObject?{
        if let data = pref.object(forKey: key) as? NSData {
            let obj = NSKeyedUnarchiver.unarchiveObject(with: data as Data)!
            return obj as AnyObject?
        }
        return nil
    }
    
    public static func getString(key:String) -> String{
        if let string = pref.string(forKey: key) {
            return string
        }else{
            return ""
        }
    }
    
    public static func getBool(key:String) -> Bool {
        if pref.bool(forKey: key) {
            return pref.bool(forKey: key)
        }else {
            return false
        }
    }
    
    public static func getDouble(key:String) -> Double {
        return pref.double(forKey:key)
    }
    
    public static func getInt(key:String) -> Int {
        return pref.integer(forKey: key)
    }
    
    
}
