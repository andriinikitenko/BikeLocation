//
//  AddFriendTableViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 06.04.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit
import Firebase

class AddFriendTableViewController: UITableViewController {

//    var users: [User] = []
    let cellId = "cellId"
    var users = [Bikers]()
    var filteredUsers = [Bikers]()
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        fetchUser()
    }
    
    func fetchUser() {
        FIRDatabase.database().reference().child("users").observe(.value, with: { (snapshot) in
            let enumerator = snapshot.children
            while let item = enumerator.nextObject() as? FIRDataSnapshot {
                guard let dict = item.value as? [String : AnyObject] else { continue }
                let user = Bikers(dictionary: dict)
                self.users.append(user)
            }
            self.filteredUsers = self.users
            self.tableView.reloadData()
        }, withCancel: nil)
    }
    
    func search(str: String) {
        filteredUsers.removeAll()
        if str.isEmpty {
            filteredUsers = users
            return
        }
        
        filteredUsers = users.filter({ (biker) -> Bool in
            return biker.name?.lowercased().contains(str.lowercased()) ?? false
        })
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        
        let user = filteredUsers[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
//        if let profileImageUrl = user.profileImageUrl {
//            cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
//        }
//        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

    // MARK: - Table view data source

//    func checkIfUserIsLoggedIn() {
//        if FIRAuth.auth()?.currentUser?.uid == nil {
//            perform(#selector(handleLogout), with: nil, afterDelay: 0)
//        }else {
//            let uid = FIRAuth.auth()?.currentUser?.uid
//            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
//                if let userDictionary = snapshot.value as? [String: AnyObject]{
//                    self.navigationItem.title = userDictionary["name"] as? String
//                }
//            
//                }, withCancel: nil)
//        }
//    }
//    
//    func handleLogout() {
//        do {
//            try FIRAuth.auth()?.signOut()
//        } catch let logoutError{
//            print(logoutError.localizedDescription)
//        }
//        let storyboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController()
//        UIApplication.shared.keyWindow?.rootViewController = viewController    }
   
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
    */

}

extension AddFriendTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(str: searchText)
        tableView.reloadData()
    }
}
