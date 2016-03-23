//
//  ShoppingListViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import Parse
import UIKit

class ShoppingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    
//    let CellIdentifier = "ShoppingItemCell"
    
    
    var newShoppingList: [PFObject]! = []
    // TEMP DEFINED THE SHOPPING LIST
    var shoppingList = ["2 sweet potatoes", "2 eggs", "1  onion", "Olive Oil", "Basil", "Thyme", "Chili Flakes", "Chives", "Parsley", "Bread"]
    var shoppingListChecked: [Int] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingListTableView.delegate = self
        shoppingListTableView.dataSource = self
        shoppingListTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        var shoppingListQuery = PFQuery(className: "ShoppingItem")
        shoppingListQuery.whereKey("user", equalTo: PFUser.currentUser()!)
        shoppingListQuery.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
            self.newShoppingList = results as [PFObject]!
            self.shoppingListChecked = [Int](count: self.newShoppingList.count, repeatedValue: 0)
            self.shoppingListTableView.reloadData()
//            print(self.newShoppingList)
        }
        

        
//        shoppingListTableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: CellIdentifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            shoppingList.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//        }
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return newShoppingList.count
//        return shoppingList.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        print("Number of Rows: \(indexPath.row)")

        var cell = shoppingListTableView.dequeueReusableCellWithIdentifier("ShoppingItemCell", forIndexPath: indexPath) as! ShoppingItemCell
        
        cell.reset()

        // OLD Setting of Cell
        //        cell.shoppingItemLabel.text = shoppingList[indexPath.row]

        // NEW Setting of Cell
        let individualItem = newShoppingList[indexPath.row]
        cell.shoppingItemLabel.text = individualItem["name"] as? String
        
        if shoppingListChecked[indexPath.row] == 0 {
//            cell.shoppingItemView.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            cell.shoppingItemLabel.textColor = cell.blackColor
            cell.itemCheckImageView.alpha = 0
        } else {
//            cell.shoppingItemView.backgroundColor = UIColor(red: 249.0/255.0, green: 212.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            cell.shoppingItemLabel.textColor = cell.grayColor
            cell.itemCheckImageView.alpha = 1
        }
        
        cell.selectionStyle = .None
        
        cell.shoppingListViewController = self
        cell.cellIndexPath = indexPath
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 46
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
