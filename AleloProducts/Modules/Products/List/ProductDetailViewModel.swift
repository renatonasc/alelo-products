//
//  ProductDetailViewModel.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

@MainActor final class ProductDetailViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var alertInfo: AlertInfo?
    @Published var selectedProduct: Product?
    @Published var isShowingDetail = false
 
    func getProducts() {
        isLoading = true
        
        Task {
            do {
                products = try await Repository.Products.listAll()
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
//                    alertInfo = AlertInfo(title: Text("Error"), message: Text(error.localizedDescription), dismissButton: .default(Text("Ok")))
                }
                isLoading = false
            }
        }
    }
    
}
