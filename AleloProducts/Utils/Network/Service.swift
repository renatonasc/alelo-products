//
//  Service.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 18/11/23.
//

import Foundation

enum RequestType {
    case get
    case post
    case put
    case patch
    case delete
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

protocol ServiceProtocol {
    func request<T:Decodable>(method: RequestType,
                              endpoint: String,
                              parameters: Dictionary<String, Any>,
                              responseType: T.Type)  async throws -> T
}

final class ServiceMocked: ServiceProtocol {
    func request<T:Decodable>(method: RequestType,
                              endpoint: String,
                              parameters: Dictionary<String, Any>,
                              responseType: T.Type)  async throws -> T {
        
        switch T.self {
        default:
            throw APIError.invalidURL
        }
    }
}

final class Service: ServiceProtocol {
    
    private let baseURL = "http://localhost:2020/"
    
    func request<T:Decodable>(method: RequestType,
                              endpoint: String,
                              parameters: Dictionary<String, Any> = [:],
                              responseType: T.Type)  async throws -> T {
        
        var url = self.baseURL + endpoint
        var request = NSMutableURLRequest()
        
        switch method {
            
            case .get:
                url = self.baseURL + endpoint + parameters.queryURL()
                request.httpMethod = "GET"
                break
            
            case .patch:
                url = self.baseURL + endpoint + parameters.queryURL()
                request.httpMethod = "PATCH"
                break
            
            case .put:
                request.httpMethod = "PUT"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                break
            
            case .post:
                request.httpMethod = "POST"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                break
            
            case .delete:
                request.httpMethod = "DELETE"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                break
        }
        
        guard let url = URL(string: url) else {
            throw APIError.invalidURL
        }
        
        request.url = url
        
        let (data, response) = try await URLSession.shared.data(for: request as URLRequest)
        let statusCode = response.statusCode() ?? 0
        do {
            let decoder = JSONDecoder()
            let obj = try decoder.decode(T.self, from: data)
            self.debugtRequest(params: parameters,
                              url: request.url,
                              code: statusCode,
                              response: data.prettyJSON,
                              error: nil)
            return obj
        } catch {
            self.debugtRequest(params: parameters,
                              url: request.url,
                              code: statusCode,
                              response: data.prettyJSON,
                              error: error)
            throw APIError.invalidData
        }
        
    }
    
    private func debugtRequest(params: [String:Any],
                              url: URL?,
                              code: Int,
                              response: NSString?,
                              error: Error?) {
        #if DEBUG
        print("=========================================================")
        print("URL: \(url?.absoluteString ?? "")")
        print("Parameters: \(params)")
        print("---------------------------------------------------------")
        print("Response: \(response ?? "")")
        if let error {
            print("Error: \(error)")
        }
        print("=========================================================")
        #endif
    }
    
}
