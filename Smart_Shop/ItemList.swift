//
//  ItemList.swift
//  Smart_Shop
//
//  Created by Erica Hsueh on 10/7/18.
//  Copyright © 2018 Erica Hsueh. All rights reserved.
//

import UIKit

class ItemList: UITableViewController {

    let dataSource = foodListDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.countOfItems()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemList", for: indexPath)

        // Configure the cell...
        let listItem = dataSource.listAtIndex(index: indexPath.row)
        cell.textLabel?.text = listItem.itemName
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource.deleteItems(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        dataSource.moveItems(from: fromIndexPath.row, to: to.row)
        
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "itemDetailSegue"){
            let selectedIndex = tableView.indexPathForSelectedRow?.row
            let selectedItem = dataSource.listAtIndex(index: selectedIndex!)
            let destination = segue.destination as! ItemDetail
            destination.foodItems = selectedItem
        }
    }
    
    @IBAction func cancel(NewItems segue: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func save(saveSegue segue: UIStoryboardSegue){
        let source = segue.source as! AddNewFoodItems
        let newItems = source.itemList
        dataSource.addItems(list: newItems!)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
