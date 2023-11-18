//
//  ProductsListView.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import SwiftUI

struct ProductsListView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .task {
            Task {
                do {
                    let products = try await Repository.Products.listAll()
                    print(products)
                } catch {
                    print (error)
                }
            }
        }
    }
        
}

#Preview {
    ProductsListView()
}
