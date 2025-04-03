//
//  RecipeView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 24/03/25.
//

import Foundation
import Kingfisher
import UIKit
import SnapKit



class RecipeView: UIView {
    
//    let videoView = VideoView()
    let imageView = UIImageView()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let countryLabel = UILabel()
    let categoryLabel = UILabel()
    let instructionTextView = UITextView()
    let ingredientsTextView = UITextView()

    let divider1 = UIView()
    let divider2 = UIView()
    let divider3 = UIView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        scrollView.showsVerticalScrollIndicator = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
             
        stackView.spacing = 14
        stackView.alignment = .leading
        stackView.axis = .vertical
        
        nameLabel.font = .systemFont(ofSize: 21)
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = "Name: "
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true 
        
        countryLabel.font = .systemFont(ofSize: 21)
        countryLabel.lineBreakMode = .byWordWrapping
        countryLabel.text = "Country: "
        countryLabel.numberOfLines = 0
        
        categoryLabel.font = .systemFont(ofSize: 21)
        categoryLabel.lineBreakMode = .byWordWrapping
        categoryLabel.text = "Category: "
        categoryLabel.numberOfLines = 0
        
        instructionTextView.font = .systemFont(ofSize: 21)
        instructionTextView.textColor = .label
        instructionTextView.textAlignment = .justified
        instructionTextView.textContainer.lineBreakMode = .byWordWrapping
        instructionTextView.isScrollEnabled = false 
        instructionTextView.isEditable = false // Important inside stack view!
        instructionTextView.text = "Instruction: \n \n"
        
        ingredientsTextView.font = .systemFont(ofSize: 21)
        ingredientsTextView.textColor = .label
        ingredientsTextView.textAlignment = .justified
        ingredientsTextView.textContainer.lineBreakMode = .byWordWrapping
        ingredientsTextView.isScrollEnabled = false
        ingredientsTextView.isEditable = false // Important inside stack view!
        ingredientsTextView.text = "Ingredients: \n"


        setupDividers()
    }
    
    func layout() {
//        addSubview(imageView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(divider1)
        stackView.addArrangedSubview(countryLabel)
        stackView.addArrangedSubview(divider2)
        stackView.addArrangedSubview(categoryLabel)
        stackView.addArrangedSubview(divider3)
        stackView.addArrangedSubview(instructionTextView)
        stackView.addArrangedSubview(ingredientsTextView)
        
//        imageView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.leading.equalToSuperview().offset(8)
//            make.trailing.equalToSuperview().offset(-8)
//            make.height.equalTo(250)
//        }
        imageView.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.height.equalTo(400 * 9/16)
        }
       
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
            
//            make.height.greaterThanOrEqualTo(1000)
        }
    }
    
    func configure(with viewModel: ViewModel) {
        guard let url = URL(string: viewModel.imageURLString) else { return }
        
        imageView.kf.setImage(
            with: url,
            options: [
                .loadDiskFileSynchronously,
                .cacheOriginalImage,
                .transition(.fade(0.25)),
            ])
        
        self.nameLabel.text = "Name:        "   + viewModel.name
        self.countryLabel.text = "Country:    " + viewModel.country
        self.categoryLabel.text = "Category:  " + viewModel.category
        instructionTextView.text = "Instruction: \n \n" + viewModel.instruction
        print(viewModel.ingriedents)
        ingredientsTextView.text =
        "Ingredients: \n \n"
        +
        "\(zip(viewModel.ingriedents, viewModel.measures).map({ "\($0) -------- \($1) \n" }).joined().isEmpty ? "" : "\(zip(viewModel.ingriedents, viewModel.measures).map({ "\($0) -------- \($1) \n" }).joined())" )"
    
        print(viewModel.videoURL)
    }
}


extension RecipeView {
    func setupDividers() {
        divider1.backgroundColor = .gray
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider1.widthAnchor.constraint(equalToConstant: 400).isActive = true
        divider1.heightAnchor.constraint(equalToConstant: 0.85).isActive = true
        
        divider2.backgroundColor = .gray
        divider2.translatesAutoresizingMaskIntoConstraints = false
        divider2.widthAnchor.constraint(equalToConstant: 400).isActive = true
        divider2.heightAnchor.constraint(equalToConstant: 0.85).isActive = true
        
        divider3.backgroundColor = .gray
        divider3.translatesAutoresizingMaskIntoConstraints = false
        divider3.widthAnchor.constraint(equalToConstant: 400).isActive = true
        divider3.heightAnchor.constraint(equalToConstant: 0.85).isActive = true
    }
}
