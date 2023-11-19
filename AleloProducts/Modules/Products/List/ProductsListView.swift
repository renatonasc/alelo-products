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
                    ProductListViewCell(product: product)
                        .onTapGesture {
                            viewModel.selectedProduct = product
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Products")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getProducts()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                ProductDetailView(product: viewModel.selectedProduct!,
                                  isShowingDetail: $viewModel.isShowingDetail)
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
