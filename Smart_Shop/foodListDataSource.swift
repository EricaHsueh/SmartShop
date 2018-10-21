 //
//  foodListDataSource.swift
//  Smart_Shop
//
//  Created by Erica Hsueh on 10/7/18.
//  Copyright © 2018 Erica Hsueh. All rights reserved.
//

import UIKit

class foodListDataSource: NSObject {
    var itemList = NSMutableArray()
    
    override init() {
        super.init()
        loadList()
    }
    
    
    func loadList(){
        let fileURL = getFileURL()
        if (FileManager.default.fileExists(atPath: fileURL.path)) {
            let contents = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as! NSArray
            itemList.addObjects(from: contents as! [Any])
            saveItems()
        }else{
            let sample1 = FoodList()
            itemList.add(sample1)
            let sample2 = FoodList(withItemName: "Cheese", expirationDate: "10/18/2018", notes: "Cheese for pasta")
            addItems(list: sample2)
            saveItems()
        }
    }
    
    func getFileURL() -> URL{
        let fileManager = FileManager.default
        let homeDir = try! fileManager.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
        let fileURL = homeDir.appendingPathComponent("smartShop.data")
        return fileURL
        
    }
    
    func saveItems(){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(itemList, toFile:fileURL.path)
    }

    func addItems(list c: FoodList){
        itemList.add(c)
        saveItems()
    }
    
    
    func countOfItems() -> Int {
        return itemList.count
    }
    
    
    func listAtIndex(index i: Int) -> FoodList {
        return itemList.object(at: i) as! FoodList
    }
    
    func deleteItems(at index: Int) {
        itemList.removeObject(at: index)
        saveItems()
    }
    
    func moveItems(from fromIndex:Int, to toIndex: Int) {
        let fromItems = listAtIndex(index: fromIndex)
        let toItems = listAtIndex(index: toIndex)
        itemList.replaceObject(at: fromIndex, with: toItems)
        itemList.replaceObject(at: toIndex, with: fromItems)
        saveItems()
    }
}


