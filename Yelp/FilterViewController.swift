//
//  FilterViewController.swift
//  Yelp
//
//  Created by isai on 9/21/14.
//  Copyright (c) 2014 isai. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate
{
    func searchWithFilters(filters: [NSString])
}

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var category: NSArray = ["Sushi","Desserts","Chinese","American","Thai","Tapas","Chinese","Moroccan"]
    var sort: NSArray = ["Best Match","Distance","Highest Rated"]
    var radius: NSArray = ["Auto","0.3 meters","1 meters"]
    var deals: NSArray = ["Offering a Deal"]

    var delegate: FilterViewControllerDelegate?
    var isExpanded: [Int:Bool]! = [Int:Bool]()
    
    var filters: [NSString] = []
    
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var filterTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filterTableView.delegate = self
        filterTableView.dataSource = self
        filterTableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = UIView(frame: CGRect(x:2, y:0, width: 400, height: 40))
        headerView.backgroundColor = UIColor.grayColor()
        
        var headerLabel = UILabel(frame: CGRect(x:2, y:0, width:400, height: 20))
        headerLabel.layer.backgroundColor = UIColor.grayColor().CGColor

        
        if (section == 0) {
            headerLabel.text = "Most Popular"
        }
        if (section == 1) {
            headerLabel.text = "Sort"
        }
        if (section == 2) {
            headerLabel.text = "Distance"
        }
        if (section == 3) {
            headerLabel.text = "Category"
        }
        headerLabel.backgroundColor = UIColor.grayColor()
        headerView.addSubview(headerLabel)
        return headerView
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dissmissFilterView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func searchFilterView(sender: AnyObject)
    {
        if(!filters.isEmpty)
        {
            self.delegate?.searchWithFilters(filters)
        }
        filters.removeAll(keepCapacity: false)
        dismissViewControllerAnimated(true, completion: nil)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0)
        {
            return 1
        }
        if(section == 1)
        {
            if let expanded = isExpanded[section]
            {
                return expanded ? 3 : 1
            }
            else
            {
                return 1
            }
        }
        
        if(section == 2)
        {
            
            if let expanded = isExpanded[section]
            {
                return expanded ? 3 : 1
            }
            else
            {
                return 1
            }
        }
        
        if (section == 3)
        {
            if let expanded = isExpanded[section]
            {
                return expanded ? category.count : 1
            }
            else
            {
                return 3
            }
        }
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = filterTableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell
        
        cell.contentView.layer.cornerRadius = 5
        cell.contentView.layer.masksToBounds = true
        cell.switchControl.hidden = true
        cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        
        
        if(indexPath.section == 3)
        {
            cell.filterTypeLabel.text = category[indexPath.row] as? String
            cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
            cell.contentView.layer.borderWidth = 1.0
            cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        }
        if(indexPath.section == 1)
        {
            cell.filterTypeLabel.text = sort[indexPath.row] as? String
            cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
            cell.contentView.layer.borderWidth = 0.5
            cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        }
        if(indexPath.section == 2)
        {
            cell.filterTypeLabel.text = radius[indexPath.row] as? String
            cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
            cell.contentView.layer.borderWidth = 0.5
            cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        }
        if(indexPath.section == 0)
        {
            if(indexPath.row == 0)
            {
                cell.switchControl.hidden = false
            }
            cell.switchControl.setOn(true, animated: true)
            cell.filterTypeLabel.text = deals[indexPath.row] as? String
            cell.contentView.layer.borderColor = UIColor.blackColor().CGColor
            cell.contentView.layer.borderWidth = 0.5
            cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        
       filterTableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let expanded = isExpanded[indexPath.section]
        {
            isExpanded[indexPath.section] = !expanded
        }
        else
        {
            isExpanded[indexPath.section] = true
        }
        
    var cell = filterTableView.cellForRowAtIndexPath(indexPath) as FilterCell
   
    filters.append(cell.filterTypeLabel.text!)
    filterTableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
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
