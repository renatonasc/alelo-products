//
//  CartListView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct CartListView: View {
    
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(cart.items) { item in
                            CartListViewCell(item: self.$cart.items[self.index(for: item)])
                        }
                        .onDelete(perform: cart.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("R$ \(cart.totalPrice.format()) - Checkout")
                    }
                    .padding(.bottom, 25)
                }
                
                if cart.items.isEmpty {
                    EmptyView(imageName: "cart", message: "Empty cart :(")
                }
            }
            .navigationTitle("Cart")
        }
    }
    
    func index(for item: CartItem) -> Int {
        if let index = cart.items.firstIndex(where: { $0.id == item.id }) {
            return index
        }
        return 0
    }
}

#Preview {
    CartListView()
}
