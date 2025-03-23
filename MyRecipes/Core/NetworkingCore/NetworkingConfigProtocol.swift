//
//  NetworkingConfigProtocol.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public protocol NetworkingConfigProtocol {
    func baseURL(endpoint: Endpoint) -> String
    func headers(endpoint: Endpoint) -> HTTPHeaders?
}

extension NetworkingConfigProtocol {
    func headers(endpoint: Endpoint) -> HTTPHeaders? { nil }
}
