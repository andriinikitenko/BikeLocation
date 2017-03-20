//
//  VwCustomTableViewCell.swift
//  BikeLocationGeekhub
//
//  Created by Andrii Nikitenko on 15.03.17.
//  Copyright © 2017 Andrii Nikitenko. All rights reserved.
//

import UIKit

class VwCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imgMenuIcon: UIImageView!
    @IBOutlet weak var lblMenuItem: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
