//
//  ProductDetailViewModel.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

@MainActor final class ProductListViewModel: ObservableObject {
    
    @Published var allProducts: [Product] = []
    @Published var isLoading = false
    @Published var alertInfo: AlertInfo?
    @Published var selectedProduct: Product?
    @Published var isShowingDetail = false
    @Published var onlyOnSale = false
 
    var products: [Product] {
        onlyOnSale ? allProducts.filter({$0.onSale == true}) : allProducts
    }
    
    func getProducts() {
        isLoading = true
        
        Task {
            do {
                allProducts = try await Repository.Products.listAll()
                isLoading = false
            } catch {
                print(error.localizedDescription)
                if let apError = error as? APIError {
                    switch apError {
                        case .invalidURL:
                            alertInfo = AlertInfoObject.invalidURL
                        case .invalidResponse:
                            alertInfo = AlertInfoObject.invalidResponse
                        case .invalidData:
                            alertInfo = AlertInfoObject.invalidData
                        case .unableToComplete:
                            alertInfo = AlertInfoObject.unableToComplete
                    }
                } else {
                    alertInfo = AlertInfoObject.genericError
                }
                isLoading = false
            }
        }
    }
    
}
