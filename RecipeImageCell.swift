//
//  RecipeImageCell.swift
//  RecipeBuilder
//
//  Created by Dorahan Arapgirlioglu on 3/13/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class RecipeImageCell: UITableViewCell {
    
    
    @IBOutlet weak var recipeImage: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadItem(image: String) {
        recipeImage.image = UIImage(named: image)
    }

}
