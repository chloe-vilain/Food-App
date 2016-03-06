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
    
    @IBAction func addNewIten(sender: AnyObject) {
        let newFoodItem = foodItemStore.createFoodItem()
        if let index = foodItemStore.allFoodItems.indexOf(newFoodItem){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
        
    }
    
    @IBAction func toggleEditingMode(sender: AnyObject) {
        if editing {
            sender.setTitle("Edit",forState: .Normal)
            setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", forState: .Normal)
            setEditing(true, animated: true)
        }
        
    }
    
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
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let foodItem = foodItemStore.allFoodItems[indexPath.row]
            foodItemStore.removeFoodItem(foodItem)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    
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

