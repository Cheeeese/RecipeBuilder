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
    
    // TEMP DEFINED THE SHOPPING LIST
    var shoppingList = ["2 sweet potatoes", "2 eggs", "1  onion", "Olive Oil", "Basil", "Thyme", "Chili Flakes", "Chives", "Parsley"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingListTableView.delegate = self
        shoppingListTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // TEMP SET AT 10
        return shoppingList.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("Row: \(indexPath.row)")

        var cell = shoppingListTableView.dequeueReusableCellWithIdentifier("ShoppingItemCell", forIndexPath: indexPath) as! ShoppingItemCell
        
        cell.shoppingItemLabel.text = shoppingList[indexPath.row]
        
        // Instantiate the pan gesture recognizer with code
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action:"onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        cell.shoppingItemView.userInteractionEnabled = true
        cell.shoppingItemView.addGestureRecognizer(panGestureRecognizer)
        
        return cell
    }
    
    
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        // Absolute (x,y) coordinates in parent view
        let point = panGestureRecognizer.locationInView(view)
        
        // Relative change in (x,y) coordinates from where gesture began.
        let translation = panGestureRecognizer.translationInView(view)
        let velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
           // shoppingListTableView.cell.shoppingItemOriginalCenter = shoppingListTableView.cell.shoppingItemView.center
//            archiveIconOriginalCenter = archiveIconView.center
//            deleteIconOriginalCenter = deleteIconView.center
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            
//            shoppingItemView.center = CGPoint(x: shoppingItemOriginalCenter.x + translation.x, y: shoppingItemOriginalCenter.y)
//            
//            iconsFollowPan()
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
//            if shoppingItemView.center.x > 287.5 && velocity.x > 0.0 {
//                
//                UIView.animateWithDuration(0.2, animations: { () -> Void in
//                    
//                    self.shoppingItemView.center = self.shoppingItemStaticRight
//                    self.iconsFollowPan()
//                    
//                    }, completion: { (Bool) -> Void in
//                        
//                        self.shoppingItemView.center = self.shoppingItemStaticLeft
//                        self.shoppingItemView.backgroundColor = self.yellowColor
//                        UIView.animateWithDuration(0.2, animations: { () -> Void in
//                            self.shoppingItemView.center = self.shoppingItemStaticCenter
//                            
//                        })
//                        
//                })
//                
//                
//            } else if shoppingItemView.center.x < 87.5 && velocity.x < 0.0 {
//                
//                UIView.animateWithDuration(0.2, animations: { () -> Void in
//                    
//                    self.shoppingItemView.center = self.shoppingItemStaticLeft
//                    self.iconsFollowPan()
//                    
//                    }, completion: { (Bool) -> Void in
//                        
//                        UIView.animateWithDuration(0.2, animations: { () -> Void in
//                            self.shoppingItemBackgroundView.frame = CGRect(x: self.shoppingItemBackgroundView.frame.origin.x, y: self.shoppingItemBackgroundView.frame.origin.y, width: self.shoppingItemBackgroundView.frame.width, height: 0.0)
//                            
//                        })
//                        
//                })
//                
//            } else {
                
//                UIView.animateWithDuration(0.2, animations: { () -> Void in
//                    
//                    self.shoppingItemView.center = self.shoppingItemStaticCenter
//                    self.iconsFollowPan()
//                    
//                    }, completion: { (Bool) -> Void in
//                        self.resetItemsPlacement()
//                        
//                })
//                
//            }
            
        }
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
