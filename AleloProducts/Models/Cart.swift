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
        if let index = items.firstIndex(where: { $0.size.size == cartItem.size.size && $0.product.name == cartItem.product.name}) {
            items[index].increment()
        } else {
            items.append(cartItem)
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
}


struct CartItem: Identifiable {
    
    let id = UUID()
    var product: Product
    var size: Size
    
    private(set) var qtd:Int {
        didSet {
            if (qtd == 0 ) {
                qtd = 1
            }
        }
    }
    
    mutating func increment() {
        qtd += 1
    }
    
    mutating func decrement() {
        qtd -= 1
    }
    
    init(product: Product, qtd: Int, size: Size) {
        self.product = product
        self.qtd = qtd
        self.size = size
    }
    
    
    var totalPrice: Double {
        Double(qtd) * product.salePrice
    }
    
    
}
