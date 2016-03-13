//
//  TempShoppingListViewController.swift
//  RecipeBuilder
//
//  Created by Matthew Verghese on 3/12/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class TempShoppingListViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Outlets for a single shopping list item
    @IBOutlet weak var archiveIconView: UIImageView!
    @IBOutlet weak var deleteIconView: UIImageView!
    @IBOutlet weak var shoppingItemView: UIImageView!
    @IBOutlet weak var shoppingItemBackgroundView: UIView!

    // Defining initial sets of colors for changing swipe colors
    let grayColor = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    let yellowColor = UIColor(red: 249.0/255.0, green: 212.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    let brownColor = UIColor(red: 217.0/255.0, green: 167.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 113.0/255.0, green: 217.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    let redColor = UIColor(red: 233.0/255.0, green: 83.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 96.0/255.0, green: 191.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    
    var shoppingItemOriginalCenter: CGPoint!
    var archiveIconOriginalCenter: CGPoint!
    var deleteIconOriginalCenter: CGPoint!
    
    var shoppingItemStaticCenter: CGPoint!
    var shoppingItemStaticRight: CGPoint!
    var shoppingItemStaticLeft: CGPoint!
    var leftIconsStaticCenter: CGPoint!
    var rightIconsStaticCenter: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable Vertical Scrolling
        scrollView.contentSize = CGSize(width: 320, height: 2300)
        
        // Instantiate the pan gesture recognizer with code
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action:"onCustomPan:")

        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
        shoppingItemView.userInteractionEnabled = true
        shoppingItemView.addGestureRecognizer(panGestureRecognizer)
        
        
        // Set the position of the Shopping Item View
        shoppingItemStaticCenter = shoppingItemView.center
        leftIconsStaticCenter = archiveIconView.center
        rightIconsStaticCenter = deleteIconView.center
        
        archiveIconOriginalCenter = archiveIconView.center
        deleteIconOriginalCenter = deleteIconView.center
        
        shoppingItemStaticRight = CGPoint(x: 600.0, y: shoppingItemView.center.y)
        shoppingItemStaticLeft = CGPoint(x: -600.0, y: shoppingItemView.center.y)
        shoppingItemBackgroundView.backgroundColor = grayColor
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func iconsFollowPan() {
        
        if shoppingItemView.center.x <= 127.5 || shoppingItemView.center.x >= 247.5 {

            archiveIconView.center = CGPoint(x: shoppingItemView.center.x - 210.0, y: archiveIconOriginalCenter.y)
            deleteIconView.center = CGPoint(x: shoppingItemView.center.x + 210.0, y: deleteIconOriginalCenter.y)

        }

    }
    
    func resetItemsPlacement() {
        shoppingItemView.center = shoppingItemStaticCenter
        archiveIconView.center = leftIconsStaticCenter
        deleteIconView.center = rightIconsStaticCenter
    }

    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        
        // Absolute (x,y) coordinates in parent view
        let point = panGestureRecognizer.locationInView(view)
        
        // Relative change in (x,y) coordinates from where gesture began.
        let translation = panGestureRecognizer.translationInView(view)
        let velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
            shoppingItemOriginalCenter = shoppingItemView.center
            archiveIconOriginalCenter = archiveIconView.center
            deleteIconOriginalCenter = deleteIconView.center

            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            
            shoppingItemView.center = CGPoint(x: shoppingItemOriginalCenter.x + translation.x, y: shoppingItemOriginalCenter.y)
            
            iconsFollowPan()
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            if shoppingItemView.center.x > 287.5 && velocity.x > 0.0 {
                
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    
                    self.shoppingItemView.center = self.shoppingItemStaticRight
                    self.iconsFollowPan()
                    
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
                    self.iconsFollowPan()
                    
                    }, completion: { (Bool) -> Void in

                        UIView.animateWithDuration(0.2, animations: { () -> Void in
                            self.shoppingItemBackgroundView.frame = CGRect(x: self.shoppingItemBackgroundView.frame.origin.x, y: self.shoppingItemBackgroundView.frame.origin.y, width: self.shoppingItemBackgroundView.frame.width, height: 0.0)

                        })
                        
                })
                
            } else {

                UIView.animateWithDuration(0.2, animations: { () -> Void in

                    self.shoppingItemView.center = self.shoppingItemStaticCenter
                    self.iconsFollowPan()

                    }, completion: { (Bool) -> Void in
                        self.resetItemsPlacement()
                        
                })

            }
            
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
