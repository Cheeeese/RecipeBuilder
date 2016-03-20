//
//  RecipeCardCell.swift
//  RecipeBuilder
//
//  Created by Anjani Bhargava on 3/16/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class RecipeCardCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    // MV Added Below
    var myRecipesViewController: MyRecipesViewController!
    var cellIndexPath: NSIndexPath!
    // MV Added Above
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
