//
//  ViewRecipeViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/12/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class ViewRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // category cell
        
        if indexPath.row == 0 {
            let recipeImageCell = tableView.dequeueReusableCellWithIdentifier("RecipeImageCell") as! RecipeImageCell
            return recipeImageCell
        }
        
        else if indexPath.row == 1 {
            let categoryCell = tableView.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell
            return categoryCell
        }
        
        // title cell
        else if indexPath.row == 2  {
            let titleCell = tableView.dequeueReusableCellWithIdentifier("TitleCell") as! TitleCell
            return titleCell
        }
        
        else if indexPath.row == 3 {
            let descriptionCell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell") as! DescriptionCell
            return descriptionCell
        }
        
        else if indexPath.row == 4 {
            let detailsCell = tableView.dequeueReusableCellWithIdentifier("DetailsCell") as! DetailsCell
            return detailsCell
        }
        
        else if indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 {
            let ingredientsCell = tableView.dequeueReusableCellWithIdentifier("IngredientsCell") as! IngredientsCell
            return ingredientsCell
        }
        
        else {
            let ingredientsCell = tableView.dequeueReusableCellWithIdentifier("IngredientsCell") as! IngredientsCell
            return ingredientsCell
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
