//
//  DescriptionInputCell.swift
//  RecipeBuilder
//
//  Created by Dorahan Arapgirlioglu on 3/13/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class DescriptionInputCell: UITableViewCell {
    
    @IBOutlet weak var descriptionInputLabel: UILabel!
    @IBOutlet weak var descriptionInputTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
