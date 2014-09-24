//
//  Filters.swift
//  Yelp
//
//  Created by isai on 9/23/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import Foundation

class filterType
{
    
    var category: NSArray = ["Thai","Sushi","Desserts","Australian","American"]
    var sort: NSArray = ["Best Match","Distance","Highest Rated"]
    var radius: NSArray = ["0.5 meters","1.0 meters","2.0 meters"]
    var deals: NSArray = ["true","false","See All"]
    
    
    func category(anyInt: NSInteger) -> String
    {
        println("anyInt: \(anyInt)")
        return category[anyInt] as String
    }
    
    func sort(anyInt: NSInteger) -> String
    {
        return sort[anyInt] as String
    }
    
    func radius(anyInt: NSInteger) -> String
    {
        return radius[anyInt] as String
    }
    
    func deals(anyInt: NSInteger) -> String
    {
        return deals[anyInt] as String
    }
    
}
