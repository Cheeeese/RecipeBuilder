//
//  CreateRecipeViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import Parse
import UIKit

class CreateRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate {

    @IBOutlet weak var recipeInputTableView: UITableView!
    
    let imagePicker = UIImagePickerController()
    var selectedImage: UIImageView!
    var addImageBtn: UIButton!
    var categoryInputTextField: UITextField!
    var descriptionInputTextView: UITextView!
    var ingredientsInputTextView: UITextView!
    var directionsInputTextView: UITextView!
    var titleInputTextField: UITextField!
    var prepTimeTextField: UITextField!
    var cookTimeTextField: UITextField!
    
    
    
    var categoryData = ["Breakfast", "Lunch", "Dinner", "Salad", "Dessert", "Drinks"]
    var picker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeInputTableView.dataSource = self
        recipeInputTableView.delegate = self
        //recipeInputTableView.rowHeight = 160
        
        self.recipeInputTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        imagePicker.delegate = self
        
        picker.delegate = self
        picker.dataSource = self
        //categoryInputTextField.inputView = picker
        //categoryInputTextField.text = nil

    }

    // go back to my recipes
    @IBAction func didTapBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
          return 7
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 3
        } else {
            return 1
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                let recipeImageInputCell = tableView.dequeueReusableCellWithIdentifier("RecipeImageInputCell") as! RecipeImageInputCell
                
                selectedImage = recipeImageInputCell.recipeImage
                addImageBtn = recipeImageInputCell.addImageBtn
                
                return recipeImageInputCell
                
            } else if indexPath.row == 1  {
                let titleInputCell = tableView.dequeueReusableCellWithIdentifier("TitleInputCell") as! TitleInputCell
                
                
                titleInputTextField = titleInputCell.titleInputTextField
                
                
                return titleInputCell
                
            } else if indexPath.row == 2 {
                let categoryInputCell = tableView.dequeueReusableCellWithIdentifier("CategoryInputCell") as! CategoryInputCell
                
                categoryInputTextField = categoryInputCell.categoryInputTextField
                categoryInputCell.categoryInputTextField.inputView = picker
                
                return categoryInputCell
                
            } else if indexPath.row == 3 {
                let descriptionInputCell = tableView.dequeueReusableCellWithIdentifier("DescriptionInputCell") as! DescriptionInputCell
                
                descriptionInputTextView = descriptionInputCell.descriptionInputTextView
                //descriptionInputCell.descriptionInputTextView.frame.size.width = descriptionInputTextView.frame.size.width
                
                descriptionInputCell.descriptionInputTextView.delegate = self
                
                //            expandTextView()
                
                return descriptionInputCell
                
            } else if indexPath.row == 4 {
                let servingsInputCell = tableView.dequeueReusableCellWithIdentifier("ServingsInputCell") as! ServingsInputCell
                
                return servingsInputCell
                
            } else if indexPath.row == 5 {
                let prepTimeInputCell = tableView.dequeueReusableCellWithIdentifier("PrepTimeInputCell") as! PrepTimeInputCell
                
                prepTimeTextField = prepTimeInputCell.prepTimeTextField
                
                return prepTimeInputCell
                
            } else {
                let cookTimeInputCell = tableView.dequeueReusableCellWithIdentifier("CookTimeInputCell") as! CookTimeInputCell
                
                cookTimeTextField = cookTimeInputCell.cookTimeTextField
                
                return cookTimeInputCell
                
            }
        } else if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                
                let ingredientsTitleCell = tableView.dequeueReusableCellWithIdentifier("IngredientsTitleCell") as! IngredientsTitleCell
                
                return ingredientsTitleCell
                
            } else if indexPath.row == 1 {
                
                let ingredientsInputCell = tableView.dequeueReusableCellWithIdentifier("IngredientsInputCell") as! IngredientsInputCell
                
                ingredientsInputTextView = ingredientsInputCell.ingredientsInputTextView
                ingredientsInputCell.ingredientsInputTextView.delegate = self
                
                return ingredientsInputCell
                
            } else {
                
                let addIngredientsCell = tableView.dequeueReusableCellWithIdentifier("AddIngredientsCell") as! AddIngredientsCell
                
                return addIngredientsCell
            }
            
            
        } else if indexPath.section == 2 {
            
            if indexPath.row == 0 {
                
                let directionsTitleCell = tableView.dequeueReusableCellWithIdentifier("DirectionsTitleCell") as! DirectionsTitleCell
                
                return directionsTitleCell
                
            } else if indexPath.row == 1 {
                
                let directionsInputCell = tableView.dequeueReusableCellWithIdentifier("DirectionsInputCell") as! DirectionsInputCell
                
                directionsInputTextView = directionsInputCell.directionsInputTextView
                directionsInputCell.directionsInputTextView.delegate = self
                
                return directionsInputCell
                
            } else {
                
                let addStepsCell = tableView.dequeueReusableCellWithIdentifier("AddStepsCell") as! AddStepsCell
                
                return addStepsCell
            }
            
        } else {
            
            let saveButtonCell = tableView.dequeueReusableCellWithIdentifier("SaveButtonCell") as! SaveButtonCell
            
            return saveButtonCell
        }
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                return 160
                
            } else if indexPath.row == 1 || indexPath.row == 2 {
                return 50
            } else if indexPath.row == 3 {
                if descriptionInputTextView == nil {
                    return 145
                } else {
                    return descriptionInputTextView.frame.height + 55
                }
            } else if indexPath.row == 4 {
                return 50
            } else if indexPath.row == 5 {
                return 50
            } else {
                return 50
            }
        } else if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                return 35
                
            } else if indexPath.row == 1 {
                if ingredientsInputTextView == nil {
                    return 70
                } else {
                    return ingredientsInputTextView.frame.height
                }
                
            } else {
                return 40
            }
            
        } else if indexPath.section == 2 {
            
            if indexPath.row == 0 {
                return 35
                
            } else if indexPath.row == 1 {
                
                if directionsInputTextView == nil {
                    return 100
                } else {
                    return directionsInputTextView.frame.height
                }
                
            } else {
                return 75
            }
            
        } else {
            return 110
        }
    }
    
    
    @IBAction func addImageTapped(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        selectedImage.image = image
        
        if addImageBtn == nil {
            addImageBtn.alpha = 1
        } else {
            //addImageBtn.alpha = 0.1
            addImageBtn.setImage(nil, forState: .Normal)
            addImageBtn.setTitle(nil, forState: .Normal)
        }
        
    }
    
    
    //Category Picker
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryInputTextField.text = categoryData[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryData[row]
    }


    @IBAction func dismissKeyboard(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    
    @IBAction func dismissCreateRecipe(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //Hide the status bar
    override func prefersStatusBarHidden() -> Bool {
        
        return true;
    }
    
    
    //Expanding Description TextView
    func expandTextView () {
        
        let fixedWidth = descriptionInputTextView.frame.size.width
        descriptionInputTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = descriptionInputTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = descriptionInputTextView.frame
        
        let height = max(newSize.height + 5, 79)
        
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: height)
        descriptionInputTextView.frame = newFrame
        
        descriptionInputTextView.scrollEnabled = false
        
    }
    
    //Expanding Ingredient TextView
    func expandIngredientsTextView () {
        
        let fixedWidth = ingredientsInputTextView.frame.size.width
        ingredientsInputTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = ingredientsInputTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = ingredientsInputTextView.frame
        
        let height = max(newSize.height + 5, 55)
        
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: height)
        ingredientsInputTextView.frame = newFrame
        
        ingredientsInputTextView.scrollEnabled = false
        
    }
    
    //Expanding Directions TextView
    func expandDirectionsTextView () {
        
        let fixedWidth = directionsInputTextView.frame.size.width
        
        directionsInputTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = directionsInputTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = directionsInputTextView.frame
        
        let height = max(newSize.height + 5, 75)
        
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: height)
        directionsInputTextView.frame = newFrame
        
        directionsInputTextView.scrollEnabled = false
        
    }
    
    
    
    func textViewDidChange(textView: UITextView) {
        //expandDirectionsTextView()
        expandIngredientsTextView()
        expandTextView()
        
        
        //var height = max(descriptionInputTextView.frame.height + 66, 165)
        //var ingredientsHeight = max(ingredientsInputTextView.frame.height + 66, 165)
        //print("height: \(height)")
        
        recipeInputTableView.beginUpdates()
        recipeInputTableView.endUpdates()
        
    }
    
    
    @IBAction func didTapSave(sender: UIButton) {
        
        var recipe = PFObject(className: "Recipe")
        
        recipe["user"] = PFUser.currentUser()
        recipe["image"] = selectedImage.image
        recipe["title"] = titleInputTextField.text
        recipe["description"] = descriptionInputTextView.text
        recipe["category"] = categoryInputTextField.text
        recipe["prep_time"] = prepTimeTextField.text
        recipe["cook_time"] = cookTimeTextField.text
        
        
        recipe.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Saved")
        }
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
