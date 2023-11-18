//
//  ProductsListView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct ProductsListView: View {
    
    @StateObject var viewModel = ProductDetailViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.products) { product in
                    Text(product.name ?? "")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .navigationTitle("Products")
                .listStyle(.plain)
            }
            .task {
                viewModel.getProducts()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
        
}

#Preview {
    ProductsListView()
}
