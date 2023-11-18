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
        .alert(item: $viewModel.alertInfo) { alertInfo in
            Alert(title: alertInfo.title,
                  message: alertInfo.message,
                  dismissButton: alertInfo.dismissButton)
        }
    }
        
}

#Preview {
    ProductsListView()
}
