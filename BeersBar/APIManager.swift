//
//  APIManager.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 28/02/24.
//

import Foundation
final class APIManager:APIManagerProtocol{
    
    func getDecodaleDataAsync<D>(from endpoint: EndPoint, with responseModel: D.Type) async -> Result<D, NetworkMangerErrors> where D : Decodable {
        do {
            let request = try createRequest(from: endpoint)
            debugPrint("sending request: \(request)")
            let (data, response) = try await URLSession.shared.data(for: request,delegate: nil)
            guard let response = response as? HTTPURLResponse else { return .failure(.invaildResponse) }
            debugPrint("Response status code:--->: \(response.statusCode)")
            switch response.statusCode {
            case 200...299:
                guard let decodeResponse = try? JSONDecoder().decode(responseModel, from: data) else { return .failure(.invalidData) }
                return .success(decodeResponse)
            case 400...499:
                return .failure(.serverError(errorCode: response.statusCode, errorMessage: response.statusCode.description))
            default:
                return .failure(.serverError(errorCode: response.statusCode, errorMessage: response.statusCode.description))
            }
        } catch {
            return .failure(.unknown("Server error!!"))
        }
    }
}

extension APIManager{
    private func createRequest(from endpoint:EndPoint) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scema
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        //url check
        guard let url = urlComponents.url else {
            throw NetworkMangerErrors.invalidURL
        }
        //parameters
        if let parameters = endpoint.parameters{
            debugPrint("Sending parameters:\(parameters)")
            urlComponents.queryItems = parameters
        }
        //method
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        //header
        request.allHTTPHeaderFields = endpoint.header
        //body
        if let body = endpoint.body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
        
        
        return request
        
    }
}
