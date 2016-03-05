//
//  ViewController.swift
//  Alpha Grocery App
//
//  Created by Chloe W Vilain on 2/23/16.
//  Copyright © 2016 Chloe W Vilain. All rights reserved.
//

import UIKit

class FoodItemViewController: UITableViewController {

    var foodItemStore : FoodItemStore!
    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) ->Int
    {
    
    return foodItemStore.allFoodItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->
        UITableViewCell {
        
        //Create a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)
        
        //Set the text on the cell with description of the item that is the nth index of
        // items, where n = row this cell will appear in on the tableview
        let foodItem = foodItemStore.allFoodItems[indexPath.row]
        cell.textLabel?.text = foodItem.name
        cell.detailTextLabel?.text = "$\(foodItem.quantity)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }


}

