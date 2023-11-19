//
//  ContentView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct MainContentView: View {
    @EnvironmentObject var cart: Cart
    var body: some View {
        TabView {
            ProductsListView()
                .tabItem { Label("Products", systemImage: "storefront") }
            
            CartListView()
                .tabItem { Label("Cart", systemImage: "cart") }
                .badge(cart.items.count)
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainContentView()
}
