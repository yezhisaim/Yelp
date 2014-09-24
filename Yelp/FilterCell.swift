//
//  filterCell.swift
//  Yelp
//
//  Created by isai on 9/23/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var filterTypeLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
