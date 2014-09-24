//
//  YelpViewController.swift
//  Yelp
//
//  Created by isai on 9/18/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

class YelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    //Outlets
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var filtersBarButton: UIBarButtonItem!
    
    //User defined vars
    var resultsArray: [Result]! = []
    var searchBar: UISearchBar!
    var searchTerm = "thai" as NSString
    
    //Yelp OAuth vars
    let kYelpConsumerKey = "qw5xQbJuqz_5B9SnTf8Uug"
    let kYelpConsumerSecret = "sbj3ovMYmOYaBf23crcTxYVpULc"
    let kYelpToken = "fXos7cstus5ZvdAZ8GInINxzgg7dC5-k"
    let kYelpTokenSecret = "HRORrP0pmJBZ42PTtHYdGroEIfQ"
    
    //Get data from Yelp
    func getDataFromYelp(searchString: NSString)
    {
        //Yelp auth
        var response = "" as NSString
        let client = YelpClient(consumerKey: kYelpConsumerKey, consumerSecret: kYelpConsumerSecret, accessToken: kYelpToken, accessSecret: kYelpTokenSecret)
        
        self.resultsArray.removeAll(keepCapacity: false)
        client.searchWithTerm(searchString,
            success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                if let resultsDictArray = response["businesses"] as [NSDictionary]? {
                    for result in resultsDictArray {
                        self.resultsArray.append(Result(result: result))
                    }
                self.resultTableView.reloadData()
                }
            }) { (operation :AFHTTPRequestOperation!, error :NSError!) -> Void in
                NSLog("error: \(error.description)");
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTableView.delegate = self
        resultTableView.dataSource = self
      //  resultTableView.rowHeight = UITableViewAutomaticDimension
      //  resultTableView.estimatedRowHeight = 100
        
        //Nav bar controls
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
        searchBar = UISearchBar(frame: CGRect(x: 0,y: 0,width: 300,height: 35))
        searchBar?.placeholder = "thai"
        searchBar?.delegate = self
        self.navigationItem.titleView = searchBar

        filtersBarButton.tintColor = UIColor.whiteColor()
        filtersBarButton.style = UIBarButtonItemStyle.Bordered
        self.navigationItem.leftBarButtonItem = filtersBarButton
        
        self.getDataFromYelp("Thai")
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.searchTerm = searchBar.text
        self.getDataFromYelp(searchBar.text);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return resultsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = resultTableView.dequeueReusableCellWithIdentifier("ResultTableViewCell") as ResultTableViewCell
        if(!resultsArray.isEmpty)
        {
         var result = resultsArray[indexPath.row]
         var row = indexPath.row + 1 as NSInteger
         cell.updateCell(row, result: result)
        }
        return cell
    }
    
    func searchWithFilters(filters: [NSString])
    {
        var params = searchTerm + ", "
        for filter in filters
        {
            params += filter + ", "
        }
        dropLast(params)
        self.getDataFromYelp(params)
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
