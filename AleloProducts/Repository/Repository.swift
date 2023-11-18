//
//  Repository.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

final class Repository {
    
    static let shared = Repository(service: Service())
    
    let service: ServiceProtocol
    
    private init(service: ServiceProtocol) {
        self.service = service
    }
    
}

extension Repository {
    
    struct Products {
        
        static func listAll() async throws -> [String] {
            
            return try await Repository.shared.service.request(method: RequestType.get,
                                                    endpoint: "products",
                                                    parameters: [:],
                                                    responseType: [String].self)
            
        }
    }
}
