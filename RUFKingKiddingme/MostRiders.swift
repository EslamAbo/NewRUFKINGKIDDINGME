//
//  MostRiders.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/21/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit
import Alamofire
import Fuzi



class MostRiders: UITableViewController     {
    
    @IBOutlet weak var ActivityC: UIActivityIndicatorView!
    @IBOutlet var TABLEVIEW: UITableView!
    var TitleList = ["Dubai","El tahoyna","El Geza","Shobraa"]
    var DesList =  ["Dubai1","El tahoyna1","El Geza1","Shobraa1"]
    var FromReg = ["Dubai2","El tahoyna2","El Geza2","Shobraa2"]
    var ToEmi = ["Dubai3","El tahoyna3","El Geza3","Shobraa3"]
    var Numberof = ["23","43","123","544"]
    
    override func viewDidLoad() {
          ActivityC.startAnimating()
        super.viewDidLoad()

//        navigationController!.navigationBar.barTintColor = UIColor.redColor()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
         TABLEVIEW.delegate = self
        TABLEVIEW.dataSource = self
//        Alamofire.request(.GET, "http://213.42.51.219/_mobfiles/CLS_MobAndroid.asmx/GetAllMostDesiredRides" )
//            .responseString { response in
//                do {
//                    let doc = try XMLDocument(string: response.result.value!)
//                    if let root = doc.root {
//                        // this should be the content within the <string></string> element
//                        //                        print(root.stringValue)
//                        
//                        let dasta = root.stringValue
//                        
//                        var allContacts: AnyObject!
//                        
//                        let testdata = dasta.dataUsingEncoding(NSUTF8StringEncoding)
//                        
//                        let allContactsData=NSData(data: testdata!)
//                        do {
//                            allContacts = try NSJSONSerialization.JSONObjectWithData(allContactsData,options: [])
//                        }catch let error as NSError {  print(error)  }
//                        if let json = allContacts as? Array<AnyObject> {
//                            for index in 0...json.count-1 {
//                                let contact : AnyObject? = json[index]
//                                let collection = contact! as! Dictionary<String, AnyObject>
//                                
//                                
//                                let LGetter  = collection["FromEmirateNameEn"]
//                                self.TitleList.append(LGetter as! String)
//                                let LIDGetter = collection["ToRegionNameEn"]
//                                self.DesList.append(LIDGetter as! String)
//                                let NumberOfdriver = collection["NoOfRoutes"]
//                                self.Numberof.append (String(NumberOfdriver as! Int))
//                                let FromRegion = collection["FromRegionNameEn"]
//                                 self.FromReg.append(FromRegion as! String)
//                                let ToRegion = collection["ToEmirateNameEn"]
//                                 self.ToEmi.append(ToRegion as! String)
//                                
//
//                                //                                self.dic = [ collection[indexx ] as! String : collection[NatIDd] as!Int]
//                                //                                    print(self.dic)
//                                
//                            }//for loop
//                            //                            print(self.NationalityIDResults)
//                            //                            print(self.IDGEtter)
//                            //                                    )
//                            //                                    let cont : AnyObject? = collection["cont"]
//                            print(self.TitleList)
//                            print(self.DesList)
//                            self.TABLEVIEW.reloadData()
//                        }}} catch let error {
//                            print(error)
//                }//catch
//                self.ActivityC.hidden = true
//                self.ActivityC.stopAnimating()
//        }//do that is in almanofire
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TitleList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : MostRiderCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MostRiderCell
          cell.FromOutLet.text = TitleList[indexPath.row]
        cell.ToOutLet.text  =  DesList[indexPath.row]
        cell.ToEmirte.text =   ToEmi[indexPath.row]
        cell.ToRegion.text =    FromReg[indexPath.row]
        cell.numberOfRes.text   =   Numberof[indexPath.row]
        
         // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if ( segue.identifier == "DetailsView"){
            
             let VC = segue.destinationViewController as! MostRidesViewController
            if let indexpath = self.tableView.indexPathForSelectedRow  {
                
                let TitleFrom = TitleList[indexpath.row] as! String
                VC.FromEmiraVar  = TitleFrom
                
                let TitleTo = DesList[indexpath.row] as! String
                VC.ToEmiraVar = TitleTo
                let fromRegion = FromReg[indexpath.row] as! String
                VC.FromRegVar = fromRegion
                let ToEmiratee = ToEmi[indexpath.row] as! String
                VC.ToRegVar = ToEmiratee
            }
        }
    }

    func WebGetValue(){
        
        Alamofire.request(.GET, "http://213.42.51.219/_mobfiles/CLS_MobAndroid.asmx/GetAllMostDesiredRides" )
            .responseString { response in
                do {
                    let doc = try XMLDocument(string: response.result.value!)
                    if let root = doc.root {
                        // this should be the content within the <string></string> element
                        //                        print(root.stringValue)
                        
                        let dasta = root.stringValue
                        
                        var allContacts: AnyObject!
                        
                        let testdata = dasta.dataUsingEncoding(NSUTF8StringEncoding)
                        
                        let allContactsData=NSData(data: testdata!)
                        do {
                            allContacts = try NSJSONSerialization.JSONObjectWithData(allContactsData,options: [])
                        }catch let error as NSError {  print(error)  }
                        if let json = allContacts as? Array<AnyObject> {
                            for index in 0...json.count-1 {
                                let contact : AnyObject? = json[index]
                                let collection = contact! as! Dictionary<String, AnyObject>
                                
                               
                                    let LGetter  = collection["FromEmirateNameEn"]
                                    self.TitleList.append(LGetter as! String)
                                    let LIDGetter = collection["ToRegionNameEn"]
                                    self.DesList.append(LIDGetter as! String)
                                    //                                self.dic = [ collection[indexx ] as! String : collection[NatIDd] as!Int]
                                    //                                    print(self.dic)
                                
                            }//for loop
                            //                            print(self.NationalityIDResults)
                            //                            print(self.IDGEtter)
                            //                                    )
                            //                                    let cont : AnyObject? = collection["cont"]
                            print(self.TitleList)
                            print(self.DesList)
                            self.TABLEVIEW.reloadData()
                        }}} catch let error {
                            print(error)
                }//catch
        }//do that is in almanofire
    }// webGetter Func
    
    
}
