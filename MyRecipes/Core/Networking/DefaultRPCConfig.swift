//
//  DefaultRPCConfig.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

struct DefaultRPCConfig: NetworkingConfigProtocol {
    let baseURL: String
    func baseURL(endpoint: Endpoint) -> String {
        return baseURL
    }
}
