//
//  ContentView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct MainContentView: View {
    var body: some View {
        TabView {
            ProductsListView()
                .tabItem { Label("Products", systemImage: "storefront") }
            
            CartListView()
                .tabItem { Label("Cart", systemImage: "cart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainContentView()
}
