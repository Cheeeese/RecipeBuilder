//
//  IngredientsCell.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/13/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class IngredientsCell: UITableViewCell {
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    var viewRecipeViewController:ViewRecipeViewController!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var itemAddedLabel: UILabel!
    
    let tealColor = UIColor(red: 74/255.0, green: 188/255.0, blue: 199/255.0, alpha:1.0)
    let blackColor = UIColor(red: 41/255.0, green: 47/255.0, blue: 51/255.0, alpha:1.0)
 
    @IBAction func didTapPlus(sender: AnyObject) {
        viewRecipeViewController.createItem(ingredientsLabel.text!)
        
        UIView.animateWithDuration(0.9, animations: { () -> Void in
            
            //rotate plus and fade in check mark
            self.plusButton.transform = CGAffineTransformMakeRotation(45)
            self.checkMark.alpha = 1
            self.checkMark.transform = CGAffineTransformMakeScale(1.15, 1.15)
            
            //hide label
            self.ingredientsLabel.alpha = 0
            
            //show item added text
            self.itemAddedLabel.alpha = 1
            
            })


        delay(1.8) { () -> () in
            UIView.animateWithDuration(0.9, animations: { () -> Void in
                //fade out check mark and unrotate plus
                self.checkMark.alpha = 0
                self.plusButton.transform = CGAffineTransformIdentity
                
                //show ingredient
                self.ingredientsLabel.alpha = 1
                
                //hide item added text
                self.itemAddedLabel.alpha = 0
                
            })
           
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
