//
//  RPCParamsBuilder.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

struct RPCParamsBuilder {
    func buildParams(with endpoint: RPCEndpoint) -> [String: Any] {
        let finalParams: [String: Any] = [:]
//        finalParams["jsonrpc"] = endpoint.version
//        finalParams["method"] = endpoint.method
//        finalParams["id"] = endpoint.id
//        if let parameters = endpoint.parameters {
//            finalParams["params"] = parameters
//        }
        return finalParams
    }
}
