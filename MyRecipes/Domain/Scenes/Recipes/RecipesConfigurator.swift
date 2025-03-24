//
//  RecipesConfigurator.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation
import UIKit

extension RecipesViewController {
   static func configure() -> RecipesViewController {
        let viewController = RecipesViewController()
        let interactor = RecipesInteractor()
        let presenter = RecipesPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
