//
//  RecipesViewController.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import UIKit
import SnapKit

protocol RecipesDisplayLogic: AnyObject {
    func showRecipes(viewModel: ViewModel)
}

class RecipesViewController: UIViewController {
    
    let getRecipeButton = UIButton(type: .system)
    let recipeView = RecipeView()
    
    var interactor: RecipesInteractorBuisessLogic?
    
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
        title = "Recipes"
        
        getRecipeButton.setTitle("Get Recipe", for: .normal)
        getRecipeButton.setTitleColor(.label, for: .normal)
        getRecipeButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        getRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        getRecipeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        getRecipeButton.backgroundColor = .systemCyan
        getRecipeButton.layer.cornerRadius = 5
        
        recipeView.translatesAutoresizingMaskIntoConstraints = false 
    }
    
    private func layout() {
        view.addSubview(getRecipeButton)
        view.addSubview(recipeView)
        
        NSLayoutConstraint.activate([
            recipeView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            recipeView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: recipeView.trailingAnchor, multiplier: 1),
            getRecipeButton.topAnchor.constraint(equalToSystemSpacingBelow: recipeView.bottomAnchor, multiplier: 2)

        ])
        getRecipeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}

extension RecipesViewController: RecipesDisplayLogic {
    
    func showRecipes(viewModel: ViewModel) {
        recipeView.configure(with: viewModel)
    }
}
