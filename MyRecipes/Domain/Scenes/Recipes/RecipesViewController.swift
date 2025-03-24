//
//  RecipesViewController.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import UIKit

protocol RecipesDisplayLogic: AnyObject {
    func showRecipes(recipe: Recipe)
}

class RecipesViewController: UIViewController {
    
    var interactor: RecipesInteractorBuisessLogic?
    var dataStore: RecipesDataStore?
    var router: RecipesRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    @objc func buttonTapped() {
        interactor?.loadRecipes()
    }
}

extension RecipesViewController {
    private func style() {
        
    }
    
    private func layout() {
        
    }
}

extension RecipesViewController: RecipesDisplayLogic {
    func showRecipes(recipe: Recipe) {
        print(recipe.category)
    }
}
