//
//  ItemDetail.swift
//  Smart_Shop
//
//  Created by Erica Hsueh on 10/7/18.
//  Copyright © 2018 Erica Hsueh. All rights reserved.
//

import UIKit

class ItemDetail: UITableViewController {
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblExpirationDate: UILabel!
    @IBOutlet weak var lblNotes: UILabel!
    
    var foodItems : FoodList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItemName.text = foodItems.itemName
        lblExpirationDate.text = foodItems.expirationDate
        lblNotes.text = foodItems.notes
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
