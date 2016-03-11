//
//  CreateRecipeVC.swift
//  Recipez
//
//  Created by Emanuel  Guerrero on 3/11/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var recipeTitleTextField: UITextField!
    @IBOutlet weak var recipeIngredientsTextField: UITextField!
    @IBOutlet weak var recipeStepsTextField: UITextField!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var addRecipeButton: UIButton!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        recipeImageView.layer.cornerRadius = 4.0
        recipeImageView.clipsToBounds = true
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImageView.image = image
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        if let title = recipeTitleTextField.text where title != "" {
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = recipeTitleTextField.text
            recipe.ingredients = recipeIngredientsTextField.text
            recipe.steps = recipeStepsTextField.text
            recipe.setRecipeImage(recipeImageView.image!)
            
            context.insertObject(recipe)
            
            do {
                try context.save()
            } catch {
                print("Could not save recipe!")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
