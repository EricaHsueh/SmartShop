//
//  FoodList.swift
//  Smart_Shop
//
//  Created by Erica Hsueh on 10/7/18.
//  Copyright © 2018 Erica Hsueh. All rights reserved.
//

import UIKit

class FoodList: NSObject, NSCoding{
    var itemName : String
    var expirationDate: String
    var notes: String

    override init() {
        itemName = "Milk"
        expirationDate = "8/6/2018"
        notes = "Use it to make cupcakes!"
        super.init()
    }
    
    init(withItemName item: String, expirationDate date: String, notes note: String) {
        itemName = item
        expirationDate = date
        notes = note
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(itemName, forKey: "ItemName")
        aCoder.encode(expirationDate, forKey: "ExpirationDate")
        aCoder.encode(notes, forKey: "Notes")
    }
    required init?(coder aDecoder: NSCoder) {
        itemName = aDecoder.decodeObject(forKey: "ItemName") as! String
        expirationDate = aDecoder.decodeObject(forKey: "ExpirationDate") as! String
        notes = aDecoder.decodeObject(forKey: "Notes") as! String
        super.init() 
    }
}
