//
//  RecipesViewController.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import UIKit
import SnapKit
import CoreData

protocol RecipesDisplayLogic: AnyObject {
    func showRecipes(viewModel: ViewModel)
}

class RecipesViewController: UIViewController {
    
    let getRecipeButton = UIButton(type: .system)
    let recipeView = RecipeView()
    var viewModel: ViewModel?
    
    var interactor: RecipesInteractorBuisessLogic?
    var managedObjectContext: NSManagedObjectContext!
    
    lazy var button: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "bookmark")
        button.style = .plain
        button.target = self
        button.action = #selector(saveRecipe)
        button.isEnabled = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setUpNavBar()
    }
    
    @objc func buttonTapped() {
        interactor?.loadRecipes()
    }
    
    @objc func saveRecipe() {
        let favRecipe = FavouriteRecipe(context: managedObjectContext)
        
        guard let viewModel = viewModel else { print("guard block"); return }
        
        favRecipe.id = viewModel.id
        favRecipe.category = viewModel.category
        favRecipe.country = viewModel.country
        favRecipe.imageURLString = viewModel.imageURLString
        favRecipe.instruction = viewModel.instruction
        favRecipe.name = viewModel.name
        favRecipe.videoURL = viewModel.videoURL
        
        do {
            try managedObjectContext.save()
        } catch {
            print(error.localizedDescription)
        }
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
    
    
    private func setUpNavBar() {
        navigationItem.rightBarButtonItem = button
    }
}

extension RecipesViewController: RecipesDisplayLogic {
    
    func showRecipes(viewModel: ViewModel) {
        recipeView.configure(with: viewModel)
        self.viewModel = viewModel
        button.isEnabled = true
    }
}
