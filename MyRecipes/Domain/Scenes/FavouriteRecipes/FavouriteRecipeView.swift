//
//  FavouriteRecipeView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 03/04/25.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class FavouriteRecipeView: UIViewController {
    
    let recipe: FavouriteRecipe
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let imageView = UIImageView()
    let instructionView = UITextView()
    let nameLablel = UILabel()
    
    init(recipe: FavouriteRecipe) {
        self.recipe = recipe
        print("first foo")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Goodbye recipeview foo")
    }
    
    override func viewDidLoad() {
        print("second foo")
        super.viewDidLoad()
        style()
        layout()
        view.backgroundColor = .systemBackground
    }
}

extension FavouriteRecipeView  {
    
    private func style() {
        
        scrollView.showsVerticalScrollIndicator = false
        
        stackView.spacing = 14
//        stackView.alignment = .leading
        stackView.axis = .vertical
        
        nameLablel.text = recipe.name
        nameLablel.textColor = .label
        nameLablel.font = .boldSystemFont(ofSize: 21)
        nameLablel.textAlignment = .center
        nameLablel.numberOfLines = 0
        nameLablel.adjustsFontSizeToFitWidth = true
        nameLablel.lineBreakStrategy = .hangulWordPriority
        
        setupImage()
        
        instructionView.font = .systemFont(ofSize: 21)
        instructionView.textColor = .label
        instructionView.textAlignment = .justified
        instructionView.textContainer.lineBreakMode = .byWordWrapping
        instructionView.isScrollEnabled = false
        instructionView.isEditable = false // Important inside stack view!
        instructionView.text = "Instruction: \n \n" + recipe.instruction
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(nameLablel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(instructionView)
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.height.equalTo(400 * 9/16)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            
            make.width.equalTo(scrollView.snp.width)
            
        }
    }
    
    private func setupImage() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        guard let urlString = recipe.imageURLString else { return }
        guard let url = URL(string: urlString) else { return }
        
        imageView.kf.setImage(
            with: url,
            options: [
                .loadDiskFileSynchronously,
                .cacheOriginalImage,
                .transition(.fade(0.25)),
            ])
    }
}
