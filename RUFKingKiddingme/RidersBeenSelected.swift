//
//  RidersBeenSelected.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/24/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit

class RidersBeenSelected: UIViewController {
    
    var RiderName : String = ""
    var Rate : String = ""
    var days : String = ""
    var STARTINGTIME :String = ""
    var ImageOfRider : UIImage?
    
    @IBOutlet weak var StartingTime: UILabel!
    
    @IBOutlet weak var RiderNameOutLet: UILabel!
    @IBOutlet weak var ImageOutLet: UIImageView!

    @IBOutlet weak var RateOutLet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ImageOutLet.layer.cornerRadius = 35.0
        ImageOutLet.layer.masksToBounds = true
        
        RiderNameOutLet.text = RiderName
        StartingTime.text = STARTINGTIME
        RateOutLet.text = Rate
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
