//
//  AddItemViewController.swift
//  GroceryList
//
//  Created by Sarvajeet Gada on 06/07/15.
//  Copyright © 2015 Sarvajeet Gada. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDelegate {
    func addToGroceryList(newItem: String)
}

class AddItemViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet var textField : UITextField?;
    var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        textField?.delegate = self;
    }
    
    @IBAction func onDoneTapped (UIBarButtonItem) {
        let newItem = (textField?.text)!.stringByReplacingOccurrencesOfString(" ", withString:"")
       
        if (!newItem.isEmpty) {
    	delegate?.addToGroceryList(newItem)
        }
        else {
            print("Unable to add blank entry")
        }
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}