//
//  CreateRecipeViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class CreateRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createRecipeImage: UIImageView!
    @IBOutlet weak var createRecipeTableView: UITableView!
    
    
    let imagePicker = UIImagePickerController()
    
    var recipeImage: UIImageView!
    var categoryTextField: UITextField!
    
    //Category Picker
    var categoryData = ["Breakfast", "Lunch", "Dinner", "Drinks"]
    var categoryPicker = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //Category picker delegation
        //categoryPicker.delegate = self
        //categoryPicker.dataSource = self
        //categoryTextField.inputView = categoryPicker
        
        //Create Recipe Table View delegate
        createRecipeTableView.dataSource = self
        createRecipeTableView.delegate = self
        
        self.createRecipeTableView.registerClass(RecipeImageCell.self, forCellReuseIdentifier: "ImageCell")
        self.createRecipeTableView.registerClass(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        
        
    }

    // go back to my recipes
    @IBAction func didTapBack(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addImage(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            print("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        recipeImage.frame = CGRectMake(0, 0, 375, 155);
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        recipeImage.image = image
        
    }
    
    //Catergory picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryData[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return categoryData[row]
    }
    
    //Dequeue the cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let imageCell = createRecipeTableView.dequeueReusableCellWithIdentifier("ImageCell") as! RecipeImageCell
            
            return imageCell
            
        } else {
            
            let categoryCell = createRecipeTableView.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell
            
            return categoryCell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }


}
