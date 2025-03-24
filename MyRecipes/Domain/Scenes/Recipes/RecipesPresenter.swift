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
    
    func presentRecipe(response: MealType) {
        response.meals.map {
            let recipe = Recipe(
                id: $0.idMeal,
                name: $0.strMeal,
                category: $0.strCategory,
                area: $0.strArea,
                instruction: $0.strInstructions,
                mealThumb: $0.strMealThumb,
                video: $0.strYoutube,
                ingriedents: [$0.strIngredient1],
                measures: [$0.strMeasure1])
            viewController?.showRecipes(recipe: recipe)
        }
    }
}
