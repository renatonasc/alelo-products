//
//  User.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 20/11/23.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var emailPromotions = false
}
