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
                        ForEach(cart.items, id: \.product.id) { cartItem in
                            ProductListViewCell(product: cartItem.product)
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
                    Text("Empty")
                }
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartListView()
}
