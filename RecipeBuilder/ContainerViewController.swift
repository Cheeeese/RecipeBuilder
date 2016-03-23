//
//  ContainerViewController.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/6/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    //outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!

    
    //variables
    var selectedIndex: Int = 0
    var myRecipesViewController: UIViewController!
    var shoppingListViewController: UIViewController!
    var timersViewController: UIViewController!
    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // create storyboard and VCs
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        myRecipesViewController = storyboard.instantiateViewControllerWithIdentifier("MyRecipesViewController")
        shoppingListViewController = storyboard.instantiateViewControllerWithIdentifier("ShoppingListViewController")
        timersViewController = storyboard.instantiateViewControllerWithIdentifier("TimersViewController")
       
        // create array of VCs
        viewControllers = [myRecipesViewController, shoppingListViewController, timersViewController]
        
        // make default view the My Recipes VC
        didTapNavItem(buttons[selectedIndex])
        buttons[selectedIndex].selected = true

    }

    //function to change contentView based on button selected
    @IBAction func didTapNavItem(sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        let previousVC = viewControllers[previousIndex]
        
        // set button to selected state (we'll need this when we have visual design done)
        if previousIndex == selectedIndex {
            
        } else {
            buttons[selectedIndex].selected = true
            buttons[previousIndex].selected = false
        }

        // remove previous view controller
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        let vc = viewControllers[selectedIndex]
        
        //calls view will appear
        addChildViewController(vc)
        
        //set view size
        vc.view.frame = contentView.bounds
        
        //add vc
        contentView.addSubview(vc.view)
        
        //calls view did appear
        vc.didMoveToParentViewController(self)
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
