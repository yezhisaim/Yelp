//
//  Result.swift
//  Yelp
//
//  Created by isai on 9/22/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import Foundation

class Result
{
    var imageLink: NSString?
    var resultName: NSString?
    var stars: NSString?
    var address: NSString?
    var cuisine: NSString?
    var priceRange: NSString?
    var distance: NSString?
    
    init(result: NSDictionary)
    {
        
        var location = result["location"] as NSDictionary
        var addressArray = location["address"] as? NSArray
        var addressFromLocation = addressArray?.firstObject as NSString
        
        imageLink = result["image_url"] as? NSString
        resultName = result["name"] as? NSString
        stars = result["rating_img_url"] as? NSString
        address = addressFromLocation
        

        var categories = "" as String
        for category in result["categories"] as NSArray {
                categories += "\(category[0]),"
            }
        cuisine = dropLast(categories)
        
        distance = "0.06 mi" as NSString
        priceRange = "$$" as NSString
    }
}