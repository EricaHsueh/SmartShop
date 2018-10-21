//
//  AddNewFoodItems.swift
//  Smart_Shop
//
//  Created by Erica Hsueh on 10/7/18.
//  Copyright © 2018 Erica Hsueh. All rights reserved.
//

import UIKit

class AddNewFoodItems: UITableViewController {
    @IBOutlet weak var txtItemName: UITextField!
    @IBOutlet weak var txtExpirationDate: UITextField!
    @IBOutlet weak var txtNotes: UITextField!
    
    var itemList: FoodList!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SaveSegue"){
            itemList = FoodList(withItemName: txtItemName.text!, expirationDate: txtExpirationDate.text!, notes: txtNotes.text!)
            
            
        }
    }
    

}
