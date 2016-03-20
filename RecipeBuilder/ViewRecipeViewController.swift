//
//  ViewRecipeViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/12/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import Parse
import UIKit

class ViewRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes: [PFObject]! = []
    var recipeObject: PFObject!
    
    var nameLabel = "Sweet Potato Hash"
    var ingredientsArray = ["2 boneless, skinless chicken thighs", "1 medium sweet potato", "1/2 cup onion", "2 teaspoons Cajun seasoning", "pinch of salt", "olive oil", "fried egg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
    
    }
    

  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // photos, deatils
        if section == 0 {
            return 5
        }
        // ingredients
        else if section == 1 {
            return ingredientsArray.count
        }
        // directions
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
            ingredientsCell.ingredientsLabel.text = ingredientsArray[indexPath.row]
            
            return ingredientsCell
        }
        
        else {
            let directionsCell = tableView.dequeueReusableCellWithIdentifier("DirectionsCell") as! DirectionsCell
            return directionsCell
        }

    }
    
    //headers
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 40))
            let label = UILabel(frame: CGRect(x: 12, y: 20, width: 300, height: 20))
            label.text = "Ingredients"
            label.textColor = UIColor.blackColor()
            label.font = UIFont(name: "SFUIText-Regular", size: 18)
            headerView.addSubview(label)
            return headerView
        }
        
        else if section == 2 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 40))
            let label = UILabel(frame: CGRect(x: 12, y: 20, width: 300, height: 20))
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

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 40
        }
    }
    
    
    // heights for rows
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            // photo
            if indexPath.row == 0 {
                return 230
            }
            // category
            else if indexPath.row == 1 {
                return 30
            }
            // title
            else if indexPath.row == 2 {
                return 30
            }
            // description
            else if indexPath.row == 3 {
                return 60
            }
            // details
            else {
                return 40
            }
        }
            
        else if indexPath.section == 1 {
            return 30
        }
        
        else {
            return 60
        }
        
    }
    
    @IBAction func didTapBack(sender: AnyObject) {
        self.navigationController!.popToRootViewControllerAnimated(true)
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
