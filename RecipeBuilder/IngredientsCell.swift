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
    
    
    
    
    @IBAction func didTapPlus(sender: AnyObject) {
        viewRecipeViewController.createItem(ingredientsLabel.text!)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.plusButton.transform = CGAffineTransformMakeRotation(45)
            self.checkMark.alpha = 1
            self.checkMark.transform = CGAffineTransformMakeScale(1.15, 1.15)
            })
        delay(1.2) { () -> () in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.checkMark.alpha = 0
                self.plusButton.transform = CGAffineTransformIdentity
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
