//
//  Bikers.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 12.04.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit


class Bikers: NSObject {
    var id: String?
    var name: String?
    var email: String?
    var profileImageUrl: String?
    init(dictionary: [String: AnyObject]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.email = dictionary["email"] as? String
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
}
