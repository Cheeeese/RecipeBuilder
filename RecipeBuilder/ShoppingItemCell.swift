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
    
    var shoppingListViewController: ShoppingListViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the position of the Shopping Item View
        shoppingItemStaticCenter = shoppingItemView.center
        leftIconsStaticCenter = archiveIconView.center
        rightIconsStaticCenter = deleteIconView.center
        
        archiveIconOriginalCenter = archiveIconView.center
        deleteIconOriginalCenter = deleteIconView.center
        
        shoppingItemStaticRight = CGPoint(x: 600.0, y: shoppingItemView.center.y)
        shoppingItemStaticLeft = CGPoint(x: -600.0, y: shoppingItemView.center.y)
        shoppingItemBackgroundView.backgroundColor = grayColor
        
        // Instantiate the pan gesture recognizer with code
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action:"onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        shoppingItemView.userInteractionEnabled = true
        shoppingItemView.addGestureRecognizer(panGestureRecognizer)
        

        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        // Absolute (x,y) coordinates in parent view
        let point = panGestureRecognizer.locationInView(self)
        
        // Relative change in (x,y) coordinates from where gesture began.
        let translation = panGestureRecognizer.translationInView(self)
        let velocity = panGestureRecognizer.velocityInView(self)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
            shoppingItemOriginalCenter = shoppingItemView.center
            //            archiveIconOriginalCenter = archiveIconView.center
            //            deleteIconOriginalCenter = deleteIconView.center
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            
            shoppingItemView.center = CGPoint(x: shoppingItemOriginalCenter.x + translation.x, y: shoppingItemOriginalCenter.y)
            //
            //            iconsFollowPan()
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            if shoppingItemView.center.x > 287.5 && velocity.x > 0.0 {

                UIView.animateWithDuration(0.2, animations: { () -> Void in

                    self.shoppingItemView.center = self.shoppingItemStaticRight
//                    self.iconsFollowPan()

                    }, completion: { (Bool) -> Void in

                        self.shoppingItemView.center = self.shoppingItemStaticLeft
                        self.shoppingItemView.backgroundColor = self.yellowColor
                        UIView.animateWithDuration(0.2, animations: { () -> Void in
                            self.shoppingItemView.center = self.shoppingItemStaticCenter

                        })

                })


            } else if shoppingItemView.center.x < 87.5 && velocity.x < 0.0 {

                UIView.animateWithDuration(0.2, animations: { () -> Void in

                    self.shoppingItemView.center = self.shoppingItemStaticLeft
//                    self.iconsFollowPan()

                    }, completion: { (Bool) -> Void in

                        
//                        self.shoppingListViewController.deleteRowsAtIndexPaths([], withRowAnimation: UITableViewRowAnimation.Automatic)
                        
//                        UIView.animateWithDuration(0.2, animations: { () -> Void in
//                            shoppingList.removeAtIndex(indexPath.row)
//                            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)

//                            self.shoppingItemBackgroundView.frame = CGRect(x: self.shoppingItemBackgroundView.frame.origin.x, y: self.shoppingItemBackgroundView.frame.origin.y, width: self.shoppingItemBackgroundView.frame.width, height: 0.0)
//
//                        })

                })

            } else {

                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    
                    self.shoppingItemView.center = self.shoppingItemStaticCenter
//                    self.iconsFollowPan()
                    
                    }, completion: { (Bool) -> Void in
//                        self.resetItemsPlacement()
                        
                })
                
            }
            
        }
    }
    


}
