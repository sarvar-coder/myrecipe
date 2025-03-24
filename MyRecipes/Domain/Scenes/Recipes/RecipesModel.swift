//
//  RecipesModel.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation

enum Recipes {
    struct Response {
        let recipe: Recipe
    }
    
    struct ViewModel {
        var recipes: [Recipe]
    }
}
