//
//  RecipesPresenter.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation


protocol RecipesPresenterLogic {
    func presentRecipe(response: MealType)
}

class RecipesPresenter: RecipesPresenterLogic {
    
    
    weak var viewController: RecipesDisplayLogic?
    
    func presentRecipe(response: MealType)  {
        response.meals.map {
            let vm = ViewModel(
                id: $0.idMeal,
                name: $0.strMeal,
                category: $0.strCategory,
                country: $0.strArea,
                instruction: $0.strInstructions,
                imageURLString: $0.strMealThumb,
                videoURL: $0.strYoutube,
                ingriedents: collectIngridents(from: $0),
                measures: collectMeasures(from: $0), 
                source: $0.strSource)
            viewController?.showRecipes(viewModel: vm)
        }
    }
    
    func collectIngridents(from recipe: MealRecipe) -> [String] {
        [
            recipe.strIngredient1,
            recipe.strIngredient2,
            recipe.strIngredient3,
            recipe.strIngredient4,
            recipe.strIngredient5,
            recipe.strIngredient6,
            recipe.strIngredient7,
            recipe.strIngredient8,
            recipe.strIngredient9,
            recipe.strIngredient10,
            recipe.strIngredient11,
            recipe.strIngredient12,
            recipe.strIngredient13,
            recipe.strIngredient14,
            recipe.strIngredient15,
            recipe.strIngredient16,
            recipe.strIngredient17,
            recipe.strIngredient18,
            recipe.strIngredient19,
            recipe.strIngredient20,
        ]
    }
    
    func collectMeasures(from recipe: MealRecipe) -> [String] {
        [
            recipe.strMeasure1,
            recipe.strMeasure2,
            recipe.strMeasure3,
            recipe.strMeasure4,
            recipe.strMeasure5,
            recipe.strMeasure6,
            recipe.strMeasure7,
            recipe.strMeasure8,
            recipe.strMeasure9,
            recipe.strMeasure10,
            recipe.strMeasure11,
            recipe.strMeasure12,
            recipe.strMeasure13,
            recipe.strMeasure14,
            recipe.strMeasure15,
            recipe.strMeasure16,
            recipe.strMeasure17,
            recipe.strMeasure18,
            recipe.strMeasure19,
            recipe.strMeasure20,
            ]
    }
}
