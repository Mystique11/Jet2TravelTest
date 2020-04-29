//
//  CustomCell.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 28/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lblComments: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var media: UIImageView!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
