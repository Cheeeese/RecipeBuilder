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
        if section == 0 {
            return 5
        }
        else {
            return 4
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let recipeImageCell = tableView.dequeueReusableCellWithIdentifier("RecipeImageCell") as! RecipeImageCell
                return recipeImageCell
            }
            else if indexPath.row == 1 {
                let categoryCell = tableView.dequeueReusableCellWithIdentifier("CategoryCell") as! CategoryCell
                return categoryCell
            }
            else if indexPath.row == 2 {
                let titleCell = tableView.dequeueReusableCellWithIdentifier("TitleCell") as! TitleCell
                return titleCell
            }
            else if indexPath.row == 3 {
                let descriptionCell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell") as! DescriptionCell
                return descriptionCell
            }
            else {
                let detailsCell = tableView.dequeueReusableCellWithIdentifier("DetailsCell") as! DetailsCell
                return detailsCell
            }
        }
        
        else if indexPath.section == 1 {
            let ingredientsCell = tableView.dequeueReusableCellWithIdentifier("IngredientsCell") as! IngredientsCell
            return ingredientsCell
        }
        
        else {
            let directionsCell = tableView.dequeueReusableCellWithIdentifier("DirectionsCell") as! DirectionsCell
            return directionsCell
        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 230
            }
            else if indexPath.row == 1 {
                return 30
            }
            else if indexPath.row == 2 {
                return 40
            }
            else if indexPath.row == 3 {
                return 50
            }
            else {
                return 40
            }
        }
            
        else {
            return 40
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
