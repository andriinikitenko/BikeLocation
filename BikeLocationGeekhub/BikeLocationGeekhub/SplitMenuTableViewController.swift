//
//  SplitMenuTableViewController.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 08.03.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit

class SplitMenuTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        
        super.viewDidLoad()

           }

}

//}
//
//func handlePan(gestureRecogniser: UIPanGestureRecognizer)  {
//    let velocity = gestureRecogniser.velocity(in: self.view)
//    let deltaX = velocity.x / 35
//    let newLeftSpace = menuViewLeftSpaseConstraint.constant + deltaX
//    
//    if gestureRecogniser.state == .changed {
//        if newLeftSpace < 0 {
//            menuViewLeftSpaseConstraint.constant = newLeftSpace
//        } else {
//            menuViewLeftSpaseConstraint.constant = 0
//        }
//        self.view.layoutIfNeeded()
//    } else if gestureRecogniser.state == .ended {
//        let menuWidth = UIScreen.main.bounds.width
//        let sholdCloseMenu = abs(self.menuViewLeftSpaseConstraint.constant) > menuWidth / 2
//        
//        UIView.animate(withDuration: 0.5, animations: {
//            if sholdCloseMenu {
//                self.menuViewLeftSpaseConstraint.constant = -menuWidth
//            } else {
//                self.menuViewLeftSpaseConstraint.constant = 0
//            }
//            self.view.layoutIfNeeded()
//            
//        })
//        
//    }
//}
//
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    super.prepare(for: segue, sender: sender)
//    let vc = segue.destination as! TaskDetailsViewController
//    vc.editMode = false
//}
//
//// Action for Sort
//// UIAlerController, type = ActionSheet, prestnt
