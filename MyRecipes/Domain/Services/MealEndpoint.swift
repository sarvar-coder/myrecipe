//
//  MealEndpoint.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation

enum MealEndpoint: RPCEndpoint {
    
    case random
    
    var path: String {
        switch self {
        case .random:
            "json/v1/1/random.php"
        }
    }
    
    var method: RPCHTTPMethod {
        switch self {
        case .random:
                .get
        }
    }
}
