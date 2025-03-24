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

protocol RecipesDataStore {
    
}

class RecipesInteractor: RecipesInteractorBuisessLogic, RecipesDataStore {
    
    var presenter: RecipesPresenterLogic?
    var service  = MealService()
    //    private var worker:
    
    func loadRecipes() {
        service.fetchMeal { result in
            switch result {
            case .success(let success):
                self.presenter?.presentRecipe(response: success)
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
