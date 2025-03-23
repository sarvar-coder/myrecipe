//
//  RPCAPIManagerFactory.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

enum RPCAPIManagerFactory {
    static func create(config: NetworkingConfigProtocol) -> RPCAPIManager {
        RPCAPIManager(
            config: config,
            paramsBuilder: RPCParamsBuilder().buildParams,
            reportErrorHandler: { error in
                debugPrint(error, "FOO")
            })
    }
}
