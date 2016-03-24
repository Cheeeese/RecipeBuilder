//
//  ShoppingItemCell.swift
//  RecipeBuilder
//
//  Created by Matthew Verghese on 3/13/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class ShoppingItemCell: UITableViewCell {

    @IBOutlet weak var shoppingItemBackgroundView: UIView!
    @IBOutlet weak var archiveIconView: UIImageView!
    @IBOutlet weak var deleteIconView: UIImageView!
    @IBOutlet weak var shoppingItemView: UIView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var itemCheckImageView: UIImageView!
    
    var shoppingItemOriginalCenter: CGPoint!
    var archiveIconOriginalCenter: CGPoint!
    var deleteIconOriginalCenter: CGPoint!
    
    var shoppingItemStaticCenter: CGPoint!
    var shoppingItemStaticRight: CGPoint!
    var shoppingItemStaticLeft: CGPoint!
    var leftIconsStaticCenter: CGPoint!
    var rightIconsStaticCenter: CGPoint!
    
    
    // Defining initial sets of colors for changing swipe colors
    let grayColor = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    let yellowColor = UIColor(red: 249.0/255.0, green: 212.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    let brownColor = UIColor(red: 217.0/255.0, green: 167.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 113.0/255.0, green: 217.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    let redColor = UIColor(red: 233.0/255.0, green: 83.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 96.0/255.0, green: 191.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    let whiteColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    let blackColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    
    
    let yellowOrangeColor = UIColor(red: 254/255.0, green: 191/255.0, blue: 39/255.0, alpha: 1.0)
    let redOrangeColor = UIColor(red: 247/255.0, green: 86/255.0, blue: 49/255.0, alpha: 1.0)

    
    var shoppingListViewController: ShoppingListViewController!
    var cellIndexPath: NSIndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the position of the Shopping Item View
        shoppingItemStaticCenter = shoppingItemView.center
        leftIconsStaticCenter = archiveIconView.center
        rightIconsStaticCenter = deleteIconView.center
        
        archiveIconOriginalCenter = archiveIconView.center
        deleteIconOriginalCenter = deleteIconView.center
        itemCheckImageView.alpha = 0
        
        shoppingItemStaticRight = CGPoint(x: 700.0, y: shoppingItemView.center.y)
        shoppingItemStaticLeft = CGPoint(x: -700.0, y: shoppingItemView.center.y)
        shoppingItemBackgroundView.backgroundColor = yellowOrangeColor
        
        // Instantiate the pan gesture recognizer with code
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action:"onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        shoppingItemView.userInteractionEnabled = true
        shoppingItemView.addGestureRecognizer(panGestureRecognizer)
        
        panGestureRecognizer.delegate = self

        shoppingItemOriginalCenter = shoppingItemView.center
        resetItems()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reset() {
        if self.shoppingItemView != nil {
            self.shoppingItemView.center = self.shoppingItemOriginalCenter
            self.shoppingItemView.backgroundColor = self.whiteColor
        }
    }
    
    func resetItems() {
        archiveIconView.center = leftIconsStaticCenter
        deleteIconView.center = rightIconsStaticCenter
        
    }
    
    func iconsFollowPan() {
        archiveIconView.center = CGPoint(x: shoppingItemView.center.x - 229.5, y: archiveIconOriginalCenter.y)
        deleteIconView.center = CGPoint(x: shoppingItemView.center.x + 255.0, y: deleteIconOriginalCenter.y)
        
    }

    
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        shoppingListViewController.isPanning = true
        
        // Absolute (x,y) coordinates in parent view
        let point = panGestureRecognizer.locationInView(self)
        
        // Relative change in (x,y) coordinates from where gesture began.
        let translation = panGestureRecognizer.translationInView(self)
        let velocity = panGestureRecognizer.velocityInView(self)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
      //      print("Gesture began at: \(point)")
            
            
            shoppingItemOriginalCenter = shoppingItemView.center
            //            archiveIconOriginalCenter = archiveIconView.center
            //            deleteIconOriginalCenter = deleteIconView.center
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
      //      print("Gesture changed at: \(point)")
            print(shoppingItemView.center)
            
            shoppingItemView.center = CGPoint(x: shoppingItemOriginalCenter.x + translation.x, y: shoppingItemOriginalCenter.y)
            
            if shoppingItemView.center.x > 270.5 || shoppingItemView.center.x < 87.5 {
                iconsFollowPan()
            }
            
            
            if shoppingItemView.center.x < 187.5 {
                shoppingItemBackgroundView.backgroundColor = redOrangeColor
            } else if shoppingItemView.center.x > 187.5 {
                shoppingItemBackgroundView.backgroundColor = yellowOrangeColor
            }
            
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
         //   print("Gesture ended at: \(point)")
            
            if shoppingItemView.center.x > 270.5 && velocity.x > 0.0 {

                UIView.animateWithDuration(0.2, animations: { () -> Void in

                    self.shoppingItemView.center = self.shoppingItemStaticRight
                    self.iconsFollowPan()

                    }, completion: { (Bool) -> Void in

                        self.shoppingItemView.center = self.shoppingItemStaticLeft
                        self.shoppingItemLabel.textColor = self.grayColor
                        self.itemCheckImageView.alpha = 1
//                        self.shoppingItemView.backgroundColor = self.yellowColor

                        self.shoppingListViewController.newShoppingList[self.cellIndexPath.row]["checked"] = 1
                        self.shoppingListViewController.newShoppingList[self.cellIndexPath.row].saveInBackground()
                        //                        self.shoppingListViewController.shoppingListChecked[self.cellIndexPath.row] = 1
//                        UIView.animateWithDuration(0.2, animations: { () -> Void in
//                            self.shoppingItemView.center = self.shoppingItemStaticCenter
//
//                        })

                        UIView.animateWithDuration(0.2, animations: { () -> Void in
                            self.shoppingItemView.center = self.shoppingItemStaticCenter
                            }, completion: { (Bool) -> Void in
                                self.resetItems()
                        })
                })


            } else if shoppingItemView.center.x < 87.5 && velocity.x < 0.0 {

                UIView.animateWithDuration(0.2, animations: { () -> Void in

                    self.shoppingItemView.center = self.shoppingItemStaticLeft
                    self.iconsFollowPan()

                    }, completion: { (Bool) -> Void in

// What is the indexPath?
// Can set the index path as a variable in the cell.  And set the index path when you load the cell
// If you're gonig to use the delte at row, need to do tableView.beginupdates and then tableview.endupdates
                        // tableview.indexpathforcell

                        //This is how you delete

                        print("This row \(self.cellIndexPath.row)")
                        print("This row \([self.cellIndexPath])")

                        // Old Code
                        //                        self.shoppingListViewController.shoppingList.removeAtIndex(self.cellIndexPath.row)
                        
                        var shoppingItemToDelete = self.shoppingListViewController.newShoppingList[self.cellIndexPath.row]
                        self.shoppingListViewController.newShoppingList.removeAtIndex(self.cellIndexPath.row)
//                        self.shoppingListViewController.shoppingListChecked.removeAtIndex(self.cellIndexPath.row)

//                        shoppingItemToDelete.deleteInBackgroundWithBlock({ (Bool, NSError?) -> Void in
//
//                        })

                        shoppingItemToDelete.deleteInBackground()
                        
                        
                        self.shoppingListViewController.shoppingListTableView.beginUpdates()
                        self.shoppingListViewController.shoppingListTableView.deleteRowsAtIndexPaths([self.cellIndexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                        self.shoppingListViewController.shoppingListTableView.endUpdates()

                        delay(1) {
                            self.shoppingListViewController.shoppingListTableView.reloadData()
                        }

//                        self.shoppingListViewController.deleteRowsAtIndexPaths([], withRowAnimation: UITableViewRowAnimation.Automatic)
                        
//                        UIView.animateWithDuration(0.2, animations: { () -> Void in

//                            self.shoppingItemBackgroundView.frame = CGRect(x: self.shoppingItemBackgroundView.frame.origin.x, y: self.shoppingItemBackgroundView.frame.origin.y, width: self.shoppingItemBackgroundView.frame.width, height: 0.0)
//
//                        })

                })

            } else {

                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    
                    self.shoppingItemView.center = self.shoppingItemStaticCenter
                    
                    }, completion: { (Bool) -> Void in
                        self.resetItems()
                        
                })
                
            }
            shoppingListViewController.isPanning = false
            
        }
    }
    
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        let panGestureRecognizer = gestureRecognizer as! UIPanGestureRecognizer
        
        let velocity = panGestureRecognizer.velocityInView(self)
        
        if abs(velocity.x) > abs(velocity.y) {
            return true
        } else {
            return false
        }
    }

}
