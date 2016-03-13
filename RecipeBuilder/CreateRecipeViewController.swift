//
//  CreateRecipeViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class CreateRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeInputTableView: UITableView!
    
    let imagePicker = UIImagePickerController()
    var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeInputTableView.dataSource = self
        recipeInputTableView.delegate = self
        //recipeInputTableView.rowHeight = 160
        
        self.recipeInputTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        imagePicker.delegate = self

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
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // category cell
        
        if indexPath.row == 0 {
            let recipeImageInputCell = tableView.dequeueReusableCellWithIdentifier("RecipeImageInputCell") as! RecipeImageInputCell
            
            selectedImage = recipeImageInputCell.recipeImage
            
            return recipeImageInputCell
        
        } else if indexPath.row == 1  {
            let titleInputCell = tableView.dequeueReusableCellWithIdentifier("TitleInputCell") as! TitleInputCell
            return titleInputCell
            
        } else {
            let categoryInputCell = tableView.dequeueReusableCellWithIdentifier("CategoryInputCell") as! CategoryInputCell
            return categoryInputCell
            
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        } else {
            return 50
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
