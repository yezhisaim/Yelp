//
//  ResultTableViewCell.swift
//  Yelp
//
//  Created by isai on 9/18/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    //Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var priceRangeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var starRatingImageView: UIImageView!
    
    func updateCell(row: NSInteger, result: Result) {
        
        var nameString = row.description + ". " + result.resultName! as NSString
        self.nameLabel.text = nameString
        self.locationLabel.text = result.address
        self.resultImageView.setImageWithURL(NSURL(string: result.imageLink!))
        self.priceRangeLabel.text = result.priceRange
        self.distanceLabel.text = result.distance
        self.cuisineLabel.text = result.cuisine
        self.starRatingImageView.setImageWithURL(NSURL(string: result.stars!))
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
