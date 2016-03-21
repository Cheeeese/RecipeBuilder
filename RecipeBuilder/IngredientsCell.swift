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
    @IBOutlet weak var plusIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
