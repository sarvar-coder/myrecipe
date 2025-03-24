//
//  RPCAPIManagerFactory.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

enum RPCAPIManagerFactory {
    static func createForMeal(config: NetworkingConfigProtocol = DefaultRPCConfig(baseURL: BaseURL.meal)) -> RPCAPIManager {
        RPCAPIManager(
            config: config,
            paramsBuilder: RPCParamsBuilder().buildParams,
            reportErrorHandler: { error in
                debugPrint(error, "FOO")
            })
        
    }
    
    static func createForCocktail(
        config: NetworkingConfigProtocol = DefaultRPCConfig(baseURL: BaseURL.cocktail))
    -> RPCAPIManager {
        RPCAPIManager(
            config: config,
            paramsBuilder: RPCParamsBuilder().buildParams) { error in
                debugPrint(error, "FOO")
            }
    }
}

struct BaseURL {
    static let meal = "https://www.themealdb.com/api/"
    static let cocktail = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
}
