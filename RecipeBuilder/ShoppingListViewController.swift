//
//  ShoppingListViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
//    let CellIdentifier = "ShoppingItemCell"
    
    // TEMP DEFINED THE SHOPPING LIST
    var shoppingList = ["2 sweet potatoes", "2 eggs", "1  onion", "Olive Oil", "Basil", "Thyme", "Chili Flakes", "Chives", "Parsley"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingListTableView.delegate = self
        shoppingListTableView.dataSource = self
        
//        shoppingListTableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: CellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            shoppingList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // TEMP SET AT 10
        return shoppingList.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("Row: \(indexPath.row)")

        var cell = shoppingListTableView.dequeueReusableCellWithIdentifier("ShoppingItemCell", forIndexPath: indexPath) as! ShoppingItemCell
        
        cell.shoppingItemLabel.text = shoppingList[indexPath.row]
        cell.selectionStyle = .None
        
        
        return cell
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
