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
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let recipeImageCell = tableView.dequeueReusableCellWithIdentifier("RecipeImageCell") as! RecipeImageCell
            return recipeImageCell
        }
        
        else if indexPath.row == 1 {
            let categoryCell = tableView.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell
            return categoryCell
        }
        
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
            
        else if indexPath.row == 5 {
            let ingredientsHeaderCell = tableView.dequeueReusableCellWithIdentifier("IngredientsHeaderCell") as! IngredientsHeaderCell
            return ingredientsHeaderCell
        }
        
        else if indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9 {
            let ingredientsCell = tableView.dequeueReusableCellWithIdentifier("IngredientsCell") as! IngredientsCell
            return ingredientsCell
        }
        
        else if indexPath.row == 10 {
            let directionsHeaderCell = tableView.dequeueReusableCellWithIdentifier("DirectionsHeaderCell") as! DirectionsHeaderCell
            return directionsHeaderCell
        }
            
        else if indexPath.row == 11 || indexPath.row == 12 || indexPath.row == 13 {
            let directionsCell = tableView.dequeueReusableCellWithIdentifier("DirectionsCell") as! DirectionsCell
            return directionsCell
        }
            
        else {
            let directionsCell = tableView.dequeueReusableCellWithIdentifier("DirectionsCell") as! DirectionsCell
            return directionsCell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 230
        }
        else if indexPath.row == 2 || indexPath.row == 4 {
            return 40
        }
        else if indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 10 {
            return 50
        }
        else {
            return 30
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
