//
//  ServiceMocked.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

final class ServiceMocked: ServiceProtocol {
    func request<T:Decodable>(method: RequestType,
                              endpoint: String,
                              parameters: Dictionary<String, Any>,
                              responseType: T.Type)  async throws -> T {
        
        switch responseType {
        case _ as ProductsResponse.Type:
            let response = ProductsResponse(products: MockData.productItems)
            return response as! T
        default:
            throw APIError.invalidURL
        }
    }
}
