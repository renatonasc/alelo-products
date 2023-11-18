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
 
    func getProducts() {
        isLoading = true
        
        Task {
            do {
                products = try await Repository.Products.listAll()
                isLoading = false
            } catch {
                print(error.localizedDescription)
                isLoading = false
            }
        }
    }
    
}
