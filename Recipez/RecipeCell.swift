//
//  RecipeCell.swift
//  Recipez
//
//  Created by Emanuel  Guerrero on 3/11/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(recipe: Recipe) {
        recipeTitle.text = recipe.title
        recipeImage.image = recipe.getRecipeImage()
    }
}
