//
//  CookTimeInputCell.swift
//  RecipeBuilder
//
//  Created by Dorahan Arapgirlioglu on 3/19/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class CookTimeInputCell: UITableViewCell {
    @IBOutlet weak var cookTimeInputLabel: UILabel!
    @IBOutlet weak var cookTimeTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
