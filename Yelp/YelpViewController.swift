//
//  YelpViewController.swift
//  Yelp
//
//  Created by isai on 9/18/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class YelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Outlets
    @IBOutlet weak var restaurantTableView: UITableView!
    
    //User defined vars
    var users = [[String:String]]() //Name:Location
    
    //Yelp OAuth vars
    let kYelpConsumerKey = "qw5xQbJuqz_5B9SnTf8Uug"
    let kYelpConsumerSecret = "sbj3ovMYmOYaBf23crcTxYVpULc"
    let kYelpToken = "fXos7cstus5ZvdAZ8GInINxzgg7dC5-k"
    let kYelpTokenSecret = "HRORrP0pmJBZ42PTtHYdGroEIfQ"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Yelp auth
        var response = "" as String
        let client = YelpClient(consumerKey: kYelpConsumerKey, consumerSecret: kYelpConsumerSecret, accessToken: kYelpToken, accessSecret: kYelpTokenSecret)
        
        client.searchWithTerm("Thai", {(operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            NSLog("response: \(response)");
            }) {(operation :AFHTTPRequestOperation!, error :NSError!) -> Void in
                NSLog("error: \(error.description)");
        }
        
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        
        users = [["Isai":"Bangalore,India"],
            ["XYZ":"Bangalore,India"],
            ["ABC":"Bangalore,India"],
            ["MNO":"Bangalore,India"]
        ]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = restaurantTableView.dequeueReusableCellWithIdentifier("RestaurantTableViewCell") as RestaurantTableViewCell
        
        var user = users[indexPath.row]
        
        for (key,value) in user
        {
            println(key)
            println(value)
            cell.nameLabel.text = key
            cell.locationLabel.text = value
        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
