//
//  MostRiderCell.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/21/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit

class MostRiderCell: UITableViewCell {

    @IBOutlet weak var numberOfRes: UILabel!
    @IBOutlet weak var ToEmirte: UILabel!
    @IBOutlet weak var ToRegion: UILabel!
    @IBOutlet weak var ImageOutLet: UIImageView!
    @IBOutlet weak var ToOutLet: UILabel!
    @IBOutlet weak var FromOutLet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
