//
//  ProductsRepository.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

extension Repository {
    
    struct Products {
        
        static func listAll() async throws -> [Product] {
            
            return try await Repository.shared.service.request(method: RequestType.get,
                                                    endpoint: "products",
                                                    parameters: [:],
                                                               responseType: ProductsResponse.self).products ?? []
            
        }
    }
}
