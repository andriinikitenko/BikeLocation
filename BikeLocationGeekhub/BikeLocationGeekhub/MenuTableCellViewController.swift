//
//  MenuTableCellViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 15.03.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit

class MenuTableCellViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   }


//var tableData: [String] = ["Ferrari", "BMW", "Mitsubishi", "Lambo"]
//
//// 1
//override func viewDidLoad() {
//    super.viewDidLoad()
//    // Register custom cell
//    let nib = UINib(nibName: "vwTblCell", bundle: nil)
//    tableView.register(nib, forCellReuseIdentifier: "cell")
//}
//
//// 2
//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return self.tableData.count
//}
//
//
//// 3
//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
//    
//    let cell:TblCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TblCell
//    
//    cell.lblCarName.text = tableData[indexPath.row]
//    cell.imgCarName.image = UIImage(named: tableData[indexPath.row])
//    
//    return cell
//}
//
//// 4
//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print("Row \(indexPath.row) selected")
//}
//
//// 5
//func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 70
//}




