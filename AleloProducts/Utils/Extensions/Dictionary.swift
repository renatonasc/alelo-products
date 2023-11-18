//
//  Dictionary.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

extension Dictionary {
    
    func queryURL() -> String {
        
        var urlVars:[String] = []
        
        for (key, value) in self {
            
            if value is Array<Any> {
                
                for v in value as! Array<Any> {
                    
                    if let encodedValue = "\(v)".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                        urlVars.append((key as! String) + "[]=" + encodedValue)
                    }
                }
            }else{
                
                if let encodedValue = (value as! String).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                    urlVars.append((key as! String) + "=" + encodedValue)
                }
            }
        }
        
        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}
