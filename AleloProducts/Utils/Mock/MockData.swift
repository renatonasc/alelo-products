//
//  MockData.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

struct MockData {
    
    static let productOne = Product(
                                name: "VESTIDO TRANSPASSE ONE",
                                style: "20002605",
                                codeColor: "20002605_613",
                                colorSlug: "tapecaria",
                                color: "TAPEÇARIA",
                                onSale: false,
                                regularPrice: "R$ 199,90",
                                actualPrice: "R$ 199,90",
                                discountPercentage: "",
                                installments:  "3x R$ 66,63",
                                image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
                                sizes: sizeItems)
    
    
    static let productTwo = Product(
                                name: "VESTIDO TRANSPASSE TWO",
                                style: "20002605",
                                codeColor: "20002605_613",
                                colorSlug: "tapecaria",
                                color: "TAPEÇARIA",
                                onSale: false,
                                regularPrice: "R$ 199,90",
                                actualPrice: "R$ 199,90",
                                discountPercentage: "",
                                installments:  "3x R$ 66,63",
                                image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
                                sizes: sizeItems)
    
    
    static let productThree = Product(
                                name: "VESTIDO TRANSPASSE THREE",
                                style: "20002605",
                                codeColor: "20002605_613",
                                colorSlug: "tapecaria",
                                color: "TAPEÇARIA",
                                onSale: true,
                                regularPrice: "R$ 139,90",
                                actualPrice: "R$ 119,90",
                                discountPercentage: "12%",
                                installments:  "3x R$ 39,97",
                                image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
                                sizes: sizeItems)
    
    static let productItems  = [productOne, productTwo, productThree]
    
    
    
    static let sizeOne    = Size(available: false,
                                    size: "PP",
                                    sku: "5807_343_0_PP")
    static let sizeTwo    = Size(available: false,
                                    size: "PP",
                                    sku: "5807_343_0_PP")
    static let sizeThree  = Size(available: false,
                                      size: "PP",
                                      sku: "5807_343_0_PP")
    
    static let sizeItems  = [sizeOne, sizeTwo, sizeThree]
    
}
