//
//  Protocols.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 17/02/24.
//

import Foundation
//protocol
protocol EndPoint {
    var scema:String{get}
    var host:String{get}
    var path:String{get}
    var method: RequestMethods {get}
    var header: [String: String]? { get }
    var body:Encodable? {get}
    var parameters:[URLQueryItem]? {get}
}

protocol APIManagerProtocol {
    func getDecodaleDataAsync<D: Decodable>(from endpoint: EndPoint,with responseModel: D.Type) async  -> Result<D, NetworkMangerErrors>
}
