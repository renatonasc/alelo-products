//
//  AleloProductsApp.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

@main
struct AleloProductsApp: App {
    
    var cart = Cart()
    
    var body: some Scene {
        WindowGroup {
            MainContentView().environmentObject(cart)
        }
    }
}
