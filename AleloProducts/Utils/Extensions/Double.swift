//
//  Double.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 19/11/23.
//

import Foundation

extension Double {
    
    func format() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.locale = Locale(identifier: "pt_BR")
        var value = formatter.string(from: self as NSNumber) ?? ""
        if !value.contains(",") {
            value += ",00"
        }
        return value
    }
}
