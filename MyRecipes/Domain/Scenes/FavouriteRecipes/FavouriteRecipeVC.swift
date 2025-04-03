//
//  FavouriteRecipeVC.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 03/04/25.
//

import Foundation
import UIKit
import SnapKit

class FavouriteRecipeVC: UIViewController {
    
    let recipe: FavouriteRecipe
    let scrollView = UIScrollView()
//    let favView = FavouriteRecipeView
    
    init(recipe: FavouriteRecipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        style()
        layout()
    }
    
    private func style() {
        
    }
    
    private func layout() {
        
    }
}
