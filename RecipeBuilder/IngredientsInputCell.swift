//
//  IngredientsInputCell.swift
//  RecipeBuilder
//
//  Created by Dorahan Arapgirlioglu on 3/19/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class IngredientsInputCell: UITableViewCell {
    @IBOutlet weak var ingredientsInputTextView: UITextView!
    @IBOutlet weak var placeholder: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
