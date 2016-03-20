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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        var query = PFQuery(className: "Recipe")
        query.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
            self.recipes = results as [PFObject]!
            self.tableView.reloadData()
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
        
        let recipe = recipes[indexPath.row]
        
        recipeCardCell.nameLabel.text = recipe["title"] as? String
        
        return recipeCardCell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let viewRecipeViewController = segue.destinationViewController as! ViewRecipeViewController
        
        viewRecipeViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
       // viewRecipeViewController.transitioningDelegate = FadeTransition
        
//        viewRecipeViewController.recipeObject = sender as! PFObject
    }
}