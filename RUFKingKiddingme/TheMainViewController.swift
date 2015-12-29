//
//  TheMainViewController.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/25/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit

class TheMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.barTintColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func theMostRiders(sender: AnyObject) {
 
        
    }
 
    @IBAction func RegistrationButton(sender: AnyObject) {
 
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
