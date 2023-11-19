//
//  Cart.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 19/11/23.
//

import SwiftUI

final class Cart: ObservableObject {
    
    @Published var items: [CartItem] = []
    
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
    
    
    func add(_ cartItem: CartItem) {
        items.append(cartItem)
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}


struct CartItem: Codable {
    
    let product: Product
    let size: String
    var qtd:Double
    
    var totalPrice: Double {
        qtd * product.salePrice
    }
    
}
