//
//  Recipe.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

struct ViewModel {
    let id: String
    let name: String
    let category: String
    let country: String
    let instruction: String
    let imageURLString: String
    let videoURL: String  
    let ingriedents: [String]
    let measures: [String]
    let source: String
}
