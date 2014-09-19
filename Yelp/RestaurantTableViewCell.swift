//
//  RestaurantTableViewCell.swift
//  Yelp
//
//  Created by isai on 9/18/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    //Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
