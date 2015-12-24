//
//  VCCell.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/24/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit

class VCCell: UITableViewCell {

    @IBOutlet weak var CallsButton: UIButton!
    @IBOutlet weak var ContactImageViaCell: UIImageView!
    @IBOutlet weak var SMSButton: UIButton!
    @IBOutlet weak var StartingTime: UILabel!
    @IBOutlet weak var ContactName: UILabel!
    @IBOutlet weak var RatingOutlet: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
