//
//  Recipe.swift
//  Recipez
//
//  Created by Emanuel  Guerrero on 3/11/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {
    func setRecipeImage(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        let image = UIImage(data: self.image!)!
        return image
    }
}
