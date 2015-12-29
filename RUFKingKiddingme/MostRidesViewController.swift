//
//  MostRidesViewController.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/21/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit

class MostRidesViewController: UIViewController , UITableViewDelegate, UITableViewDataSource    {
 
    
    var ToEmiraVar : String!
    var FromEmiraVar : String!
    var FromRegVar : String!
    var ToRegVar : String!
    
    var StartingTimes = ["1","2","3","4"]
    var rate = ["5","6","7","8"]
    var ContactName = [ "Mean Snake","Mohamed Arafa","Hema El 3ashe2","Nezar matsha3'rnash"]
    var ImageSet = ["Fotor_14323060802767.jpg","Fotor_143230595276267.jpg","Fotor_143230622191292.jpg","frbackgroundtwo.jpg"]
    @IBOutlet weak var TableView2: UITableView!
    @IBOutlet weak var FromEmirat: UILabel!
    @IBOutlet weak var FromREgion: UILabel!
    
    @IBOutlet weak var ToREgion: UILabel!
    @IBOutlet weak var ToEmirate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        RiderImage.layer.cornerRadius = RiderImage.frame.size.width/2
//        RiderImage.clipsToBounds = true
        
        TableView2.delegate = self
        TableView2.dataSource = self
//        navigationController!.navigationBar.barTintColor = UIColor.redColor()
//        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        FromEmirat.text = FromEmiraVar
        FromREgion.text = FromRegVar
        ToEmirate.text = ToRegVar
        ToREgion.text = ToEmiraVar
        
        // Do any additional setup after loading the view.
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
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return ContactName.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell : VCCell = tableView.dequeueReusableCellWithIdentifier("Cell2") as! VCCell
        cell.StartingTime.text = StartingTimes[indexPath.row]
        cell.ContactName.text = ContactName[indexPath.row]
        cell.RatingOutlet.text = rate[indexPath.row]
        var image = cell.ContactImageViaCell
////
//        image.layer.cornerRadius = image.frame.size.height/2
//        image.clipsToBounds = true
//
        image.image = UIImage(named: ImageSet[indexPath.row])
        image.layer.cornerRadius = 35.0
        image.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if ( segue.identifier == "DetailsView2"){
            
            let VC = segue.destinationViewController as! RidersBeenSelected
            if let indexpath = self.TableView2.indexPathForSelectedRow  {
                
                
                VC.STARTINGTIME = StartingTimes[indexpath.row]
                VC.RiderName =  ContactName[indexpath.row]
                VC.Rate = rate[indexpath.row]
                
//                let TitleFrom = TitleList[indexpath.row] as! String
//                VC.FromEmiraVar  = TitleFrom
//                
//                let TitleTo = DesList[indexpath.row] as! String
//                VC.ToEmiraVar = TitleTo
//                let fromRegion = FromReg[indexpath.row] as! String
//                VC.FromRegVar = fromRegion
//                let ToEmiratee = ToEmi[indexpath.row] as! String
//                VC.ToRegVar = ToEmiratee
            }
        }
    }

}
