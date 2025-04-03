//
//  DefaultViewModel.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 26/03/25.
//

import Foundation

struct DefaultViewModel {
    static func make() -> ViewModel {
        return ViewModel(
            id: "53080",
            name: "Blini Pancakes",
            category: "Side",
            country: "Russian",
            instruction: "In a large bowl, whisk together 1/2 cup buckwheat flour, 2/3 cup all-purpose flour, 1/2 teaspoon salt, and 1 teaspoon yeast.\r\n\r\nMake a well in the center and pour in 1 cup warm milk, whisking until the batter is smooth.\r\n\r\nCover the bowl and let the batter rise until doubled, about 1 hour.\r\n\r\nEnrich and Rest the Batter\r\nStir 2 tablespoons melted butter and 1 egg yolk into the batter.\r\n\r\nIn a separate bowl, whisk 1 egg white until stiff, but not dry.\r\n\r\nFold the whisked egg white into the batter.\r\n\r\nCover the bowl and let the batter stand 20 minutes.\r\n\r\nPan-Fry the Blini\r\nHeat butter in a large nonstick skillet over medium heat.\r\n\r\nDrop quarter-sized dollops of batter into the pan, being careful not to overcrowd the pan. Cook for about 1 minute or until bubbles form.\r\n\r\nTurn and cook for about 30 additional seconds.\r\n\r\nRemove the finished blini onto a plate and cover them with a clean kitchen towel to keep warm. Add more butter to the pan and repeat the frying process with the remaining batter.",
            imageURLString: "https://www.themealdb.com/images/media/meals/0206h11699013358.jpg",
            videoURL: "ttps://www.youtube.com/watch?v=GsB8ZI5vREA",
            ingriedents: ["Buckwheat", "Flour", "Salt", "Yeast", "Milk", "Butter", "Egg"],
            measures: ["1/2 cup ", "2/3 Cup", "1/2 tsp", "1 tsp", "1 cup", "2 tbs", "1 Seperated"], 
            source: "https://www.thespruceeats.com/russian-blini-recipe-buckwheat-pancakes-1136797")
    }
}
