//
//  ViewController.swift
//  GroceryList
//
//  Created by Sarvajeet Gada on 29/06/15.
//  Copyright © 2015 Sarvajeet Gada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
    let ListTableViewControllerIdentifier = "ListTableViewControllerIdentifier"

    @IBAction func onViewGroceryListButtonTapped(UIButton) {
        let groceryListTableViewController = self.storyboard!.instantiateViewControllerWithIdentifier(ListTableViewControllerIdentifier) as UIViewController
            self.navigationController!.pushViewController(groceryListTableViewController, animated: true)
    }
}
