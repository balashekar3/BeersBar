//
//  Enums.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 17/02/24.
//

import Foundation
//enum
enum RequestMethods:String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    
}

enum NetworkMangerErrors:Error{
    case invalidURL
    case invaildResponse
    case invalidData
    case serverError(errorCode:Int,errorMessage:String)
    case unknown(String?)
    
    var errorDiscription:String{
        switch self {
        case .invalidURL:
            return "Invalid Url"
        case .invaildResponse:
            return "Invaild Response"
        case .invalidData:
            return "Invaild Data"
        case .serverError(errorCode: let errorCode, errorMessage: let errorMessage):
            return "UnknownError!! Code: \(errorCode), error message: \(errorMessage)"
        case .unknown(_):
            return "Somthing went wrong!"
        }
    }
}

enum CallBackEvent {
    case loading
    case stopLoading
    case dataLoded
    case error(Error?)
}

enum APIEndpoints {
    case getBeers
}

extension APIEndpoints:EndPoint{
    
    
    var scema: String {
        "https"
    }
    
    var host: String {
        "api.punkapi.com"
    }
    
    var path: String {
        switch self {
        case .getBeers:
            return "/v2/beers"
        }
    }
    
    var method: RequestMethods {
        switch self {
        case .getBeers:
            return .get
        }
    }
    
    
    var body: Encodable? {
        switch self {
        case .getBeers:
            return nil
        }
    }
    var header: [String : String]? {
        switch self {
        case .getBeers:
            return ["Content-Type": "application/json"]
        }
    }
    var parameters: [URLQueryItem]? {
        switch self {
        case .getBeers:
            return .none
        }
    }
    
    
}

