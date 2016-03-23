//
//  MyRecipesViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import Parse
import UIKit

class MyRecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {
    
    var recipes: [PFObject]! = []
    var recipePhoto: [PFObject]! = []
    
    @IBOutlet weak var emptyStateView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func handleEmptyState() {
        if recipes.count == 0 {
            self.emptyStateView.hidden = false
        } else {
            self.emptyStateView.hidden = true
        }
    }
    
    func onTimer() {
        if PFUser.currentUser() != nil {
            let query = PFQuery(className: "Recipe")
            query.whereKey("user", equalTo: PFUser.currentUser()!)
            query.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
                self.recipes = results as [PFObject]!
                self.handleEmptyState()
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let recipeCardCell = tableView.dequeueReusableCellWithIdentifier("RecipeCardCell") as! RecipeCardCell
        
        // MV Added Below
        recipeCardCell.myRecipesViewController = self
        recipeCardCell.cellIndexPath = indexPath
        // MV Added Above
        
        // getting Recipe Title
        let recipe = recipes[indexPath.row]
        recipeCardCell.nameLabel.text = recipe["title"] as? String
        
        
        // getting recipe image
        if recipe["image"] as? String == "empty" {
            
        } else {
            let recipeImageFile = recipe["image"] as! PFFile
            recipeImageFile.getDataInBackgroundWithBlock {
                (imageData: NSData?, error: NSError?) -> Void in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data:imageData)
                        recipeCardCell.recipeImageContainer.image = image
                    }
                }
            }
        }
        return recipeCardCell
    }
    
    @IBAction func didTapLogout(sender: AnyObject) {
        performSegueWithIdentifier("LogoutSegue", sender: self)
        PFUser.logOut()
        var currentUser = PFUser.currentUser() // this will now be nil
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ViewRecipeSegue" {
            let cellIndexRow = tableView.indexPathForSelectedRow?.row
            
            let viewRecipeViewController = segue.destinationViewController as! ViewRecipeViewController
            let recipe = recipes[cellIndexRow!]
            
            viewRecipeViewController.recipeObject = recipe as! PFObject
        }
    }
}