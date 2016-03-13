//
//  ShoppingItemCell.swift
//  RecipeBuilder
//
//  Created by Matthew Verghese on 3/13/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import UIKit

class ShoppingItemCell: UITableViewCell {

    @IBOutlet weak var shoppingItemBackgroundView: UIView!
    @IBOutlet weak var archiveIconView: UIImageView!
    @IBOutlet weak var deleteIconView: UIImageView!
    @IBOutlet weak var shoppingItemView: UIView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    var shoppingItemOriginalCenter: CGPoint!
    var archiveIconOriginalCenter: CGPoint!
    var deleteIconOriginalCenter: CGPoint!
    
    var shoppingItemStaticCenter: CGPoint!
    var shoppingItemStaticRight: CGPoint!
    var shoppingItemStaticLeft: CGPoint!
    var leftIconsStaticCenter: CGPoint!
    var rightIconsStaticCenter: CGPoint!
    
    // Defining initial sets of colors for changing swipe colors
    let grayColor = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
    let yellowColor = UIColor(red: 249.0/255.0, green: 212.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    let brownColor = UIColor(red: 217.0/255.0, green: 167.0/255.0, blue: 117.0/255.0, alpha: 1.0)
    let greenColor = UIColor(red: 113.0/255.0, green: 217.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    let redColor = UIColor(red: 233.0/255.0, green: 83.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 96.0/255.0, green: 191.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the position of the Shopping Item View
        shoppingItemStaticCenter = shoppingItemView.center
        leftIconsStaticCenter = archiveIconView.center
        rightIconsStaticCenter = deleteIconView.center
        
        archiveIconOriginalCenter = archiveIconView.center
        deleteIconOriginalCenter = deleteIconView.center
        
        shoppingItemStaticRight = CGPoint(x: 600.0, y: shoppingItemView.center.y)
        shoppingItemStaticLeft = CGPoint(x: -600.0, y: shoppingItemView.center.y)
        shoppingItemBackgroundView.backgroundColor = grayColor
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
