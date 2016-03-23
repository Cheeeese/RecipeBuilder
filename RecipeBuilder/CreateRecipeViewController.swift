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
    
    // for ingredient placeholder
    var placeholder: UILabel!
    var placeholderArray: [UILabel]! = []
    
    // for direction placeholder
    var placeholderDirections: UILabel!
    var placeholderArrayDirections: [UILabel]! = []
    
    var placeholderDescription: UILabel!

    var ingredientsArray: [UITextView]! = []
    var directionsArray: [UITextView]! = []
    
    var ingredientRowNumber = [1,2,3,4]
    var directionsRowNumber = [1,2,3,4]
    
    var categoryData = ["Breakfast", "Appetizer", "Salad", "Entree", "Dessert", "Beverages"]
    var picker = UIPickerView()
    
    var ingredientHeights: [Int : CGFloat]! = [Int : CGFloat]()
    var directionHeights: [Int : CGFloat]! = [Int : CGFloat]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeInputTableView.dataSource = self
        recipeInputTableView.delegate = self
        //recipeInputTableView.rowHeight = 160
        
        self.recipeInputTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        imagePicker.delegate = self
        
        picker.delegate = self
        picker.dataSource = self
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
            return ingredientRowNumber.count
        } else if section == 2 {
            return directionsRowNumber.count
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
                placeholderDescription = descriptionInputCell.placeholder
                
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
        
        //SECTION 1 - INGREDIENTS
        } else if indexPath.section == 1 {
            
            let ingredientsInputCell = tableView.dequeueReusableCellWithIdentifier("IngredientsInputCell") as! IngredientsInputCell
            
            if indexPath.row % 2 == 0 {
                ingredientsInputCell.ingredientsInputTextView.backgroundColor = UIColor(red: 245/255, green: 248/255, blue: 250/255, alpha: 1.0)
            } else {
                
                ingredientsInputCell.ingredientsInputTextView.backgroundColor = UIColor(red: 225/255, green: 232/255, blue: 237/255, alpha: 1.0)
            }
           
            ingredientsInputTextView = ingredientsInputCell.ingredientsInputTextView
            ingredientsInputCell.ingredientsInputTextView.delegate = self
            
            // NEW CODE: If the textview is already in the ingredientsArray, don't add it (ANJANI'S COWORKER)
            if ingredientsArray.contains(ingredientsInputCell.ingredientsInputTextView) == false {
                ingredientsArray.append(ingredientsInputCell.ingredientsInputTextView)
            }
            // END NEW CODE

            placeholder = ingredientsInputCell.placeholder
            placeholderArray.append(ingredientsInputCell.placeholder)
            
            
            
            
            // delete button for ingredients cells
            let image = UIImage(named: "deleteCell.png") as UIImage?
            let deleteBtn: UIButton = UIButton(frame: CGRectMake(330, 18, 15, 15))
            deleteBtn.setTitleColor(UIColor(red: 74/255, green: 188/255, blue: 188/255, alpha: 1.0) /* #4abcbc */, forState: UIControlState.Normal)
            deleteBtn.setImage(image, forState: .Normal)
            deleteBtn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            deleteBtn.tag = 3               // change tag property
            ingredientsInputCell.addSubview(deleteBtn) // add to view as subview

            return ingredientsInputCell
        
        //SECTION 2 - DIRECTIONS
        } else if indexPath.section == 2 {
            
            let directionsInputCell = tableView.dequeueReusableCellWithIdentifier("DirectionsInputCell") as! DirectionsInputCell
            
            
            // check if row is even or odd and change backgroundColor
            if indexPath.row % 2 == 0 {
                directionsInputCell.directionsInputTextView.backgroundColor = UIColor(red: 245/255, green: 248/255, blue: 250/255, alpha: 1.0)
            } else {
                
                directionsInputCell.directionsInputTextView.backgroundColor = UIColor(red: 225/255, green: 232/255, blue: 237/255, alpha: 1.0)
            }
            
            directionsInputTextView = directionsInputCell.directionsInputTextView
            directionsInputCell.directionsInputTextView.delegate = self
            
            //NEW CODE (ANJANI'S COWORKER)
            if directionsArray.contains(directionsInputCell.directionsInputTextView) == false {
                directionsArray.append(directionsInputCell.directionsInputTextView)
            }
            //END NEW CODE

            placeholderDirections = directionsInputCell.placeholder
            placeholderArrayDirections.append(directionsInputCell.placeholder)
            
            
            // delete button for directions cells
            let image = UIImage(named: "deleteCell.png") as UIImage?
            let deleteBtn: UIButton = UIButton(frame: CGRectMake(330, 26, 15, 15))
            deleteBtn.setTitleColor(UIColor(red: 74/255, green: 188/255, blue: 188/255, alpha: 1.0) /* #4abcbc */, forState: UIControlState.Normal)
            deleteBtn.setImage(image, forState: .Normal)
            deleteBtn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            deleteBtn.tag = 4               // change tag property
            directionsInputCell.addSubview(deleteBtn) // add to view as subview
            
            return directionsInputCell
        
        //SECTION 3 - SAVE BUTTON
        } else {
            
            let saveButtonCell = tableView.dequeueReusableCellWithIdentifier("SaveButtonCell") as! SaveButtonCell
            
            return saveButtonCell
        }
    }
    
    
    //headers go here
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // ingredients is section 1 so set here for section 1 here
        if section == 1 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 30))
            headerView.backgroundColor = UIColor.whiteColor()
            let label = UILabel(frame: CGRect(x: 17, y: 7, width: 300, height: 20))
            label.text = "Ingredients"
            label.textColor = UIColor.blackColor()
            label.font = UIFont(name: "SFUIText-Regular", size: 18)
            headerView.addSubview(label)
            return headerView
        }
            
            // directions is section 2 so set here for section 2 here
        else if section == 2 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 30))
            headerView.backgroundColor = UIColor.whiteColor()
            let label = UILabel(frame: CGRect(x: 17, y: 7, width: 300, height: 20))
            label.text = "Directions"
            label.textColor = UIColor.blackColor()
            label.font = UIFont(name: "SFUIText-Regular", size: 18)
            headerView.addSubview(label)
            return headerView
        }
            
        else {
            return nil
        }
    }
    
    // set heights for headers
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }
        else if section == 3 {
            return 0.01
        } else {
            return 40
        }
    }
    
    // footers go here
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        // ingredients is section 1 so set here for section 1 here
        if section == 1 {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 40))
            let addIngredientBtn: UIButton = UIButton(frame: CGRectMake(-7, 10, 200, 15))
            footerView.backgroundColor = UIColor.whiteColor()
            addIngredientBtn.setTitleColor(UIColor(red: 74/255, green: 188/255, blue: 188/255, alpha: 1.0) /* #4abcbc */, forState: UIControlState.Normal)
            addIngredientBtn.setTitle("+ Add another ingredient", forState: UIControlState.Normal)
            addIngredientBtn.titleLabel!.font = UIFont(name: "SFUIText-Regular", size: 13)
            addIngredientBtn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            addIngredientBtn.tag = 1               // change tag property
            footerView.addSubview(addIngredientBtn) // add to view as subview
            return footerView
        }
            
            // directions is section 2 so set here for section 2 here
        else if section == 2 {
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 40))
            footerView.backgroundColor = UIColor.whiteColor()
            let addStepBtn: UIButton = UIButton(frame: CGRectMake(-25, 10, 200, 15))
            addStepBtn.setTitleColor(UIColor(red: 74/255, green: 188/255, blue: 188/255, alpha: 1.0) /* #4abcbc */, forState: UIControlState.Normal)
            addStepBtn.setTitle("+ Add another step", forState: UIControlState.Normal)
            addStepBtn.titleLabel!.font = UIFont(name: "SFUIText-Regular", size: 13)
            addStepBtn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            addStepBtn.tag = 2               // change tag property
            footerView.addSubview(addStepBtn) // add to view as subview
            return footerView
        }
            
        else {
            return nil
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.01
        }
        else {
            return 40
        }
    }


    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                return 160
             
            } else if indexPath.row == 1 || indexPath.row == 2 {
                return 50
                
            //Defining the height when DESCRIPTION has no text and when it has. Basically expanding textview height implementation
                
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
            
            //Defining the height when INGREDIENTS has no text and when it has. Basically expanding textview height implementation

            let height = ingredientHeights[indexPath.row]
            
            return height ?? 50
            
        } else if indexPath.section == 2 {
            
            //Defining the height when DIRECTIONS has no text and when it has. Basically expanding textview height implementation
            
            let height = directionHeights[indexPath.row]
            
            return height ?? 70
            
        } else {
            return 110
        }
    }
    
    //Adding photo to recipe
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


    //Dismiss the keyboard on tap
    @IBAction func dismissKeyboard(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
    //Dismiss the create recipe viewcontroller
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
    
    //Expanding Generic TextView
    func fittedSize(textView: UITextView, minHeight: CGFloat = 50) -> CGSize {
        
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = textView.frame
        
        let height = max(newSize.height, minHeight)
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: height)
        
        textView.frame = newFrame
        textView.scrollEnabled = false
        
        return newFrame.size
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        let cell = textView.superview!.superview! as! UITableViewCell
        let indexPath = recipeInputTableView.indexPathForCell(cell)!
        recipeInputTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Middle, animated: true)
    }

    
    //Check the expanding texview functions
    func textViewDidChange(textView: UITextView) {
        let cell = textView.superview!.superview! as! UITableViewCell
        let indexPath = recipeInputTableView.indexPathForCell(cell)!
        
        if indexPath.section == 0 {
            expandTextView()
        } else if indexPath.section == 1 {
            let size = fittedSize(textView)
            
            ingredientHeights[indexPath.row] = size.height
        } else if indexPath.section == 2 {
            let size = fittedSize(textView, minHeight: 70)
            
            directionHeights[indexPath.row] = size.height
        }
        
        
        // Show and hide placeholder
        print("Ingredients array count \(ingredientsArray.count)")
        print("Index Path Row \(indexPath.row)")
        
        if indexPath.section == 1 {
            if ingredientsArray[indexPath.row].text.characters.count < 1 {
                placeholderArray[indexPath.row].alpha = 1
            } else {
                placeholderArray[indexPath.row].alpha = 0
            }
        }
        
        if indexPath.section == 2 {
            if directionsArray[indexPath.row].text.characters.count < 1 {
                placeholderArrayDirections[indexPath.row].alpha = 1
            } else {
                placeholderArrayDirections[indexPath.row].alpha = 0
            }

        }
        
        if descriptionInputTextView.text == "" {
            placeholderDescription.alpha = 1
        } else {
            placeholderDescription.alpha = 0
        }
        
        recipeInputTableView.beginUpdates()
        recipeInputTableView.endUpdates()
        
    }

    // DELETE function - buggy behavior
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            if indexPath.section == 1 {
//                //ingredientsArray.removeAtIndex(indexPath.row)
//                recipeInputTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//            }
//        }
//    }
    
    func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
  
        if btnsendtag.tag == 1 {
            ingredientRowNumber.append(ingredientRowNumber.count + 1)
            //print(rowNumber.count)
            self.recipeInputTableView.reloadData()
        } else if btnsendtag.tag == 2 {
            directionsRowNumber.append(directionsRowNumber.count + 1)
            self.recipeInputTableView.reloadData()
        } else if btnsendtag.tag == 3 {
            self.ingredientRowNumber.removeAtIndex(0)
            self.recipeInputTableView.reloadData()
        } else if btnsendtag.tag == 4 {
            self.directionsRowNumber.removeAtIndex(0)
            self.recipeInputTableView.reloadData()
        }
    }
    
    //Save recipe by sending data to server
    @IBAction func didTapSave(sender: UIButton) {
        
//        recipeInputTableView.reloadData()
        
        var recipe = PFObject(className: "Recipe")
   //     var currentRecipeId: ObjectIdentifier!
       
        
        recipe["user"] = PFUser.currentUser()
        //recipe["image"] = selectedImage.image
        recipe["title"] = titleInputTextField.text
        recipe["description"] = descriptionInputTextView.text
        recipe["category"] = categoryInputTextField.text
        recipe["prep_time"] = prepTimeTextField.text
        recipe["cook_time"] = cookTimeTextField.text
        
        // anjani added code here
        if selectedImage.image != nil {
            let imageData = UIImagePNGRepresentation(selectedImage.image!)
            let imageFile = PFFile(name:"image.png", data:imageData!)
            recipe["image"] = imageFile
        } else {
            let emptyImageContainer = UIImage(named: "blankImage")
            
            let emptyImage = UIImagePNGRepresentation(emptyImageContainer!)
            let emptyImageFile = PFFile(name:"image.png", data:emptyImage!)
            
            recipe["image"] = emptyImageFile
        }
        // end added code
        
        recipe.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        }
        
        var currentRecipeObject = recipe

        //NEW CODE DOWN HERE (ANJANI'S COWORKER)
        for index in 0...(ingredientsArray.count - 1) {
            let ingredientsName = ingredientsArray[index].text
            if ingredientsName != nil && ingredientsName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0 {
                
                var ingredients = PFObject(className: "Ingredients")
                ingredients["name"] = ingredientsName
                ingredients["recipe"] = currentRecipeObject
                
                ingredients.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                }
            }
       }
        
        //NEW CODE DOWN HERE (ANJANI'S COWORKER)
        for index in 0...(directionsArray.count - 1) {
            
            let directionName = directionsArray[index].text
            if directionName != nil && directionName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0 {
                var directions = PFObject(className: "Directions")
                directions["name"] = directionName
                directions["recipe"] = currentRecipeObject
                
                directions.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                }
            }
        }
        
        // for some reason does not update the myRecipesViewController
        dismissViewControllerAnimated(true, completion: nil)
        
        
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
