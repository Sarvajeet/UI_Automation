//
//  GroceryListTableViewController.swift
//  GroceryList
//
//  Created by Sarvajeet Gada on 29/06/15.
//  Copyright © 2015 Sarvajeet Gada. All rights reserved.
//

import Foundation
import UIKit

class GroceryListTableViewController: UITableViewController, AddItemDelegate {
    
    let GroceryListCellIdentifier = "GroceryListCellIdentifier"
    let AddItemViewControllerIdentifier = "AddItemViewControllerIdentifier"
    let GroceryListUserDefaultsKey = "GroceryList"
    
    var  groceryList : [NSString] {
        get {
            var item : [NSString]? = NSUserDefaults.standardUserDefaults().objectForKey(GroceryListUserDefaultsKey) as? [NSString]
            if item == nil {
                item = ["Milk", "flour", "eggs", "Butter", "Baking Soda", "Sugar", "Whipped Cream"]
            }
            return item!
        }
        set (newObject) {
            let newItem = newObject as [NSString]
            NSUserDefaults.standardUserDefaults().setObject(newItem, forKey:GroceryListUserDefaultsKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: GroceryListCellIdentifier)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groceryList.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let groceryListCell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(GroceryListCellIdentifier, forIndexPath: indexPath)
        groceryListCell.textLabel?.text = self.groceryList[indexPath.row] as String
        return groceryListCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("I clicked on Table View Rows")
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            groceryList.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    @IBAction func addItem (UIBarButtonItem) {
        let addItemViewController = self.storyboard!.instantiateViewControllerWithIdentifier(AddItemViewControllerIdentifier) as! AddItemViewController
        addItemViewController.delegate = self
        self.navigationController!.pushViewController(addItemViewController, animated: true)
    }
    
    func addToGroceryList(newItem: String) {
        self.groceryList.append(newItem)
        self.tableView.reloadData()
    }
    
}