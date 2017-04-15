//
//  SideMenuViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 14.03.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit
import Firebase
class SideMenuViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
//        logout()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            //Detecting tap to static cell =)
            
            logout()
            
        }
    }


//class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//
//    @IBOutlet var tableView: UITableView!
//    var tableData: [String] = ["map", "menu", "Друзі", "Налаштування","Вийти"]
//    
//    // 1
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Register custom cell
//        let nib = UINib(nibName: "vwTbCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "cell")
//    }
//    
//    // 2
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.tableData.count
//    }
//    
//    
//    // 3
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
//        
//        let cell:VwCustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! VwCustomTableViewCell
//        
//        cell.lblMenuItem.text = tableData[indexPath.row]
//        cell.imgMenuIcon.image = UIImage(named: tableData[indexPath.row])
//        
//        return cell
//    }
//    
//    // 4
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Row \(indexPath.row) selected")
//    }
//    
//    // 5
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
//
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
//    */
//
//}

func logout() {
    do {
        let preferences = UserDefaults.standard
        preferences.set(nil, forKey: "UserId")
        //  Save to disk
        preferences.synchronize()
        
        try FIRAuth.auth()?.signOut()
    } catch let logoutError {
        print(logout)
    }
    let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
    let viewController = storyboard.instantiateInitialViewController()
    UIApplication.shared.keyWindow?.rootViewController = viewController
}
}

