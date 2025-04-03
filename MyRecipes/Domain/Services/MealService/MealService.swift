//
//  MealService.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation

protocol MealServiceProtocol {
    func fetchMeal(completion: @escaping (Result<MealType, Error>) -> Void)
}

class MealService: MealServiceProtocol {
    
    let apiManager: APIManager
    let jsonMapper: JSONMapper
    let group = DispatchGroup()
    
    init(apiManager: APIManager = RPCAPIManagerFactory.createForMeal(),
         jsonMapper: JSONMapper = JSONMapperImp()) {
        self.apiManager = apiManager
        self.jsonMapper = jsonMapper
    }
    
    func fetchMeal(completion: @escaping (Result<MealType, Error>) -> Void) {
        apiManager.request(with: MealEndpoint.random) { result in
            self.group.enter()
            completion(self.jsonMapper.mapToResult(from: result, for: nil, type: MealType.self))
            self.group.leave()
        }
    }
}



