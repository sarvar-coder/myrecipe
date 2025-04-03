//
//  RecipesInteractor.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation

protocol RecipesInteractorBuisessLogic {
    func loadRecipes()
}

class RecipesInteractor: RecipesInteractorBuisessLogic {
    
    var presenter: RecipesPresenterLogic?
    let service  = MealService()
    
    func loadRecipes() {
        service.fetchMeal { result in
            switch result {
            case .success(let success):
                self.presenter?.presentRecipe(response: success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
