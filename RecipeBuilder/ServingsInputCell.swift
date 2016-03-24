//
//  ServingsInputCell.swift
//  RecipeBuilder
//
//  Created by Dorahan Arapgirlioglu on 3/16/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class ServingsInputCell: UITableViewCell {
    
    @IBOutlet weak var ServingsInputLabel: UILabel!
    @IBOutlet weak var servingSize: UILabel!
    @IBOutlet weak var servingInput: UIStepper!

    @IBAction func servingChanged(sender: UIStepper) {
        servingSize.text = Int(sender.value).description
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
