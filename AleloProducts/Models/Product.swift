//
//  Product.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

// MARK: - ProductsResponse
struct ProductsResponse: Codable {
    let products: [Product]?
}

// MARK: - Product
struct Product: Codable, Identifiable {
    
    let id: String = UUID().uuidString
    let name, style, codeColor, colorSlug: String?
    let color: String?
    let onSale: Bool?
    let regularPrice, actualPrice, discountPercentage, installments: String?
    let image: String?
    let sizes: [Size]?

    enum CodingKeys: String, CodingKey {
        case id
        case name, style
        case codeColor = "code_color"
        case colorSlug = "color_slug"
        case color
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case installments, image, sizes
    }
}
