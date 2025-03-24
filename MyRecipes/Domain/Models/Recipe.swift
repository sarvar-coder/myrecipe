//
//  Recipe.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

struct Recipe {
    let id: String
    let name: String
    let category: String
    let area: String
    let instruction: String
    let mealThumb: String
    let video: String  
    let ingriedents: [String]
    let measures: [String]
}
