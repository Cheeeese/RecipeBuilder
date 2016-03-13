//
//  TempShoppingListViewController.swift
//  RecipeBuilder
//
//  Created by Matthew Verghese on 3/12/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class TempShoppingListViewController: UIViewController {

    
    @IBOutlet weak var archiveIconView: UIImageView!
    @IBOutlet weak var deleteIconView: UIImageView!
    @IBOutlet weak var shoppingItemView: UIImageView!
    @IBOutlet weak var shoppingItemBackgroundView: UIView!
    
    let grayColor = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    let yellowColor = UIColor(red: 249.0/255.0, green: 212.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    let brownColor = UIColor(red: 217.0/255.0, green: 167.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 113.0/255.0, green: 217.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    let redColor = UIColor(red: 233.0/255.0, green: 83.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 96.0/255.0, green: 191.0/255.0, blue: 222.0/255.0, alpha: 1.0)    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
