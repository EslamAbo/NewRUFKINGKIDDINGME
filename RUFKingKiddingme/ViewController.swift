//
//  ViewController.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/3/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import UIKit
import Alamofire
import Fuzi


class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate , UITextFieldDelegate, UITableViewDelegate,   UITableViewDataSource{
    let datePicker = UIDatePicker()

    var languageDictioanry = [String:Int]()
    var LanguageIDGetter = [Int]()
    var dic = [String:Int]()
    var IDGEtter = [Int]()
    var autocompleteUrls = [String]()
    var NationalityIDResults = [String]()
    var PreferedLanguagesResult = [String]()
    var AWesome : NSString = ""
    
    enum SelectAbuttonFromThe3Knights : Int {
        case Passenger
        case Both
        case Driver
    }
    
    enum MaleOrFemaleThatIsTheQuestion : Int {
        case WithOutMustache
        case WithMushtache
        case SliderBetweenTheMushtaches
    }
    
    // the outLets
    //the Buttons OutLets
    @IBOutlet weak var TheRealFirstNameText: UITextField!
    @IBOutlet weak var MaleButton: UIButton!
    @IBOutlet weak var TheSliderNot: UIButton!
    @IBOutlet weak var FemaleButton: UIButton!
    @IBOutlet weak var DatePickerTextOutLet: UITextField!
    @IBOutlet weak var AutoComTable: UITableView!
    @IBOutlet weak var PassengerButtonoutler: UIButton!
    
    @IBOutlet weak var bothButtonoutLet: UIButton!
    @IBOutlet weak var ScrollViewOutlet: UIScrollView!
    
    @IBOutlet weak var DriverbuttonOutlet: UIButton!
    //Text OutLets
    @IBOutlet weak var FirstnameoutLet: UITextField!
    
    @IBOutlet weak var LastnameoutLet: UITextField!
    
    @IBOutlet weak var userNameOutLet: UITextField!
    @IBOutlet weak var PassWordOutlet: UITextField!
    @IBOutlet weak var MobileOutLet: UITextField!
    @IBOutlet weak var NationalityOutLet: UITextField!
    //////////////
    // the main empty Variables except the URlKey to make a default
    var RuDriverOrPassengerURLKey : String = "RegisterDriver"
    var firstName : String = ""
    var LastName : String = ""
    var MobileNum : String = ""
    var UserName : String = ""
    var PassWord : String = ""
    
    var Gender : String = "M"
    var PhotoName : String = "NoImage.png"
    var LicencesScaned : String = "nofile.jpg"
    var TrafficFileNum : String = "" // empty
    var BirthDate : String = ""
    
    var NatinalityID : String = ""  // that will equal the index of for
    var PreferedLanguage : String = ""
    //////////////
    
    @IBAction func ButtonsThe3ofThem(sender: UIButton) {
        
        let OfCourseYouR = true // that to make it loop every time i click the button
        print(OfCourseYouR)
        if OfCourseYouR {
            switch sender.tag {
                
            case SelectAbuttonFromThe3Knights.Passenger.rawValue:
                PassengerButtonoutler.setImage(UIImage(named: "passengeractive.png"), forState: UIControlState.Normal)
                DriverbuttonOutlet.setImage(UIImage(named: "driveroff.png"), forState: UIControlState.Normal)
                bothButtonoutLet.setImage(UIImage(named: "bothoff.png"), forState: UIControlState.Normal)
                RuDriverOrPassengerURLKey = "RegisterPassenger"
                print(RuDriverOrPassengerURLKey)
                
            case SelectAbuttonFromThe3Knights.Driver.rawValue:
                DriverbuttonOutlet.setImage(UIImage(named: "driveractive.png"), forState: UIControlState.Normal)
                PassengerButtonoutler.setImage(UIImage(named: "passengeroff.png"), forState: UIControlState.Normal)
                bothButtonoutLet.setImage(UIImage(named: "bothoff.png"), forState: UIControlState.Normal)
                RuDriverOrPassengerURLKey = "RegisterDriver"
                print(RuDriverOrPassengerURLKey)
                
            case SelectAbuttonFromThe3Knights.Both.rawValue:
                bothButtonoutLet.setImage(UIImage(named: "bothactive.png"), forState: UIControlState.Normal)
                DriverbuttonOutlet.setImage(UIImage(named: "driveroff.png"), forState: UIControlState.Normal)
                PassengerButtonoutler.setImage(UIImage(named: "passengeroff.png"), forState: UIControlState.Normal)
                RuDriverOrPassengerURLKey = "RegisterDriver"
                print(RuDriverOrPassengerURLKey)
                
            default:
                print("error with the 3 Knights")
                
            }//switch
        }//if
    }//button
    
    @IBAction func MaleOrFemaleThereIsNo3rd(sender: UIButton) {
        
        let RUSure = true // that to make it loop every time i click the button
        if RUSure {
            switch sender.tag {
                
            case MaleOrFemaleThatIsTheQuestion.WithOutMustache.rawValue:
                FemaleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
                MaleButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                TheSliderNot.setImage(UIImage(named: "slidefemalear"), forState: UIControlState.Normal)
                Gender = "F"
                print(Gender)
                break
                
            case MaleOrFemaleThatIsTheQuestion.WithMushtache.rawValue:
                MaleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
                FemaleButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                TheSliderNot.setImage(UIImage(named: "slidefemale"), forState: UIControlState.Normal)
                Gender = "M"
                print(Gender)
                break
            default:
                print("error with the Gender Picker")
                
            }//switch
        }//if
    }//button
    
    @IBAction func MaleOrFemaleSlider(sender: AnyObject) {
        if Gender == "M" {
                  FemaleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
                  MaleButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                  TheSliderNot.setImage(UIImage(named: "slidefemalear.png"), forState: UIControlState.Normal)
                  Gender = "F"
                  print(Gender)
        } else if  Gender == "F" {
                   MaleButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
                   FemaleButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                   TheSliderNot.setImage(UIImage(named: "slidefemale.png"), forState: UIControlState.Normal)
                   Gender = "M"
                   print(Gender)
                                                }
    }
  
    
    var picker = UIPickerView() // that call the picker
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // The Auto Compelete Delegates
        DatePickerTextOutLet.delegate = self
        NationalityOutLet.delegate = self
        AutoComTable!.delegate = self
        AutoComTable!.dataSource = self
        AutoComTable!.scrollEnabled = true
        AutoComTable!.hidden = true
        
        //the hight of the scroll view :
        ScrollViewOutlet.contentInset = UIEdgeInsetsMake(0, 0, 730, 0)
        
        
        // The picker code  Delegates
       PickerSensei(FirstnameoutLet)
        
        
        WebGetterArigatouGozaimasu()
        changeTheHintColor(TheRealFirstNameText     )
        
        //        print(self.PrefferedLanguagesResult,self.NationalityIDResults)
//        print(NationalityIDResults)
//        print(PreferedLanguagesResult)
    }
    func changeTheHintColor(textField:UITextField ){
       
        TheRealFirstNameText.attributedPlaceholder = NSAttributedString(string:"Firstname",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        LastnameoutLet.attributedPlaceholder = NSAttributedString(string:"lastname",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        MobileOutLet.attributedPlaceholder = NSAttributedString(string:"Mobile number",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        userNameOutLet.attributedPlaceholder = NSAttributedString(string:"Username(Email)",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        PassWordOutlet.attributedPlaceholder = NSAttributedString(string:"Password",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        NationalityOutLet.attributedPlaceholder = NSAttributedString(string:"Nationality",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        DatePickerTextOutLet.attributedPlaceholder = NSAttributedString(string:"Date of Birth",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
        FirstnameoutLet.attributedPlaceholder = NSAttributedString(string:"Language",
            attributes:[NSForegroundColorAttributeName: UIColor.redColor()])
    }
    
    
    @IBAction func SaveButton(sender: AnyObject) {
        
        checkForErrors()
        if !checkForErrors(){
            
        TestItOrLeaveIt()
        TestoItOrLeaveIt()
        GetTheValueFromtextFieldToTheIDVars()
        print(PreferedLanguage)
        print(NatinalityID)
            firstName = TheRealFirstNameText.text!
            LastName = LastnameoutLet.text!
            MobileNum = MobileOutLet.text!
            UserName = userNameOutLet.text!
            PassWord = PassWordOutlet.text!
            BirthDate = DatePickerTextOutLet.text!
            
            print(firstName,LastName,MobileNum,UserName,PassWord,firstName,NatinalityID,PreferedLanguage)
            firstName = firstName.stringByAddingPercentEncodingWithAllowedCharacters( NSCharacterSet.URLHostAllowedCharacterSet())!
            LastName = LastName.stringByAddingPercentEncodingWithAllowedCharacters( NSCharacterSet.URLHostAllowedCharacterSet())!
            UserName = UserName.lowercaseString      // didn't check it

            let path =  "http://213.42.51.219/_mobfiles/CLS_MobAndroid.asmx/\(RuDriverOrPassengerURLKey)?firstName=\(firstName)&lastName=\(LastName)&mobile=\(MobileNum)&username=\(UserName)&password=\(PassWord)&gender=\(Gender)&photoName=\(PhotoName)&licenseScannedFileName=\(LicencesScaned)&TrafficFileNo=\(TrafficFileNum)&BirthDate=\(BirthDate)&NationalityId=\(NatinalityID)&PreferredLanguageId=\(PreferedLanguage)"
            print(path)
            
            WebServiesSire(path)
        }
//        if TextEditCompletion {
        
//            switch sender.tag{
//                
//            case TheTextTags.FirstNameIsIncall.rawValue :
//                print(TheRealFirstNameText.text!)
//            case TheTextTags.LastNameIsIncall.rawValue :
//                print(LastnameoutLet.text!)
//            case TheTextTags.mobileNumInCall.rawValue:
//                print(MobileOutLet.text)
//            case TheTextTags.UserNameInCall.rawValue:
//                print(MobileOutLet.text)
//            case TheTextTags.PassWordInCall.rawValue:
//                print(PassWordOutlet.text)
//            case TheTextTags.NationalityInCall.rawValue:
//                print(NationalityOutLet.text)
//            case TheTextTags.DateOfBirthInCall.rawValue:
//                print(DatePickerTextOutLet.text)
//            case TheTextTags.LangaugeInCall.rawValue:
//                print(FirstnameoutLet.text)
//            default:
//                print("error with the Text Tags or Rules")
//                
//                
//            }
            
//        }  If TextEditing  = true
//        GetTheIdValueFromTheVarsToTheURL()    //
        
        
        //        testDic()
    }
    //////////////////////// The Begining of Auto Compelete
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        // print("banana")
        AutoComTable!.hidden = false
        
        let text = NationalityOutLet.text ?? ""
        
        let substring = ( text as NSString  ).stringByReplacingCharactersInRange(range, withString: string )
        
        searchAutocompleteEntriesWithSubstring(substring)
        return true
    }
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autocompleteUrls.removeAll(keepCapacity: false)
        // print(substring)
        
        for curString in NationalityIDResults
        {
            //   print(curString)
            let myString: NSString! = curString as! NSString
            let substringRange: NSRange! = myString.rangeOfString(substring)
            if (substringRange.location == 0)
            {
                autocompleteUrls.append(String(curString))
            }
        }
        
        AutoComTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autocompleteUrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as UITableViewCell!
        //  print(cell)
        
        if let tempo1 = cell
        {
            let index = indexPath.row as Int
            cell!.textLabel!.text = autocompleteUrls[index]
        } else
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
        }
        return cell!
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        //     var currentTextField = textField.text
        NationalityOutLet.text = selectedCell.textLabel!.text
        AutoComTable!.hidden = true
        
    }
    
    ////////////////////////////////////////// The End of Auto Compelete
    
    ///////// web Getter
    func WebGetterArigatouGozaimasu(){
       
        
        let nationalityIdUrl = "http://213.42.51.219/_mobfiles/CLS_MobAndroid.asmx/GetNationalities?id=0"
        WebGetValue(nationalityIdUrl, indexx: "NationalityEnName", NatIDd: "ID", LanguageIndex: "",LanguageIDNum:"")
        //NationalityEnName
        let PreferedLanguageURL = "http://213.42.51.219/_mobfiles/CLS_MobAndroid.asmx/GetPrefferedLanguages"
        WebGetValue(PreferedLanguageURL, indexx: "", NatIDd: "", LanguageIndex: "LanguageEnName",LanguageIDNum:"LanguageId")
        
        
        //        let url2 = "http://sharekni-web.sdg.ae/_mobfiles/CLS_MobAndroid.asmx/GetNationalities?id=\(NatinalityID)"
        //        CoolClass().WebServiesSire(url2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///////////////////////////////////Language picker
    
    
    func PickerSensei(textField:UITextField){
        let picker: UIPickerView
        picker = UIPickerView(frame: CGRectMake(0, 200, view.frame.width, 200))
        picker.backgroundColor = .whiteColor()
        
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 226/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "donePicker")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        //        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "CancelPicker")
        
        
        toolBar.setItems([  spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        
        textField.inputView = picker
        textField.inputAccessoryView = toolBar
    }
    func donePicker() {
        PickerSensei(FirstnameoutLet)
        if ((FirstnameoutLet.text?.characters.count) < 1 ){
            FirstnameoutLet.text = "Arabic"
            
        }
        FirstnameoutLet.resignFirstResponder()
        
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: PreferedLanguagesResult[row], attributes: [NSForegroundColorAttributeName : UIColor.redColor()])
        return attributedString
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return  1
        
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return PreferedLanguagesResult.count
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        FirstnameoutLet.text = String(PreferedLanguagesResult[row])
//        FirstnameoutLet.endEditing(true)
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.PreferedLanguagesResult[row]
    }
    
    //////////////////////// end of Langauge picker
    
    
    //////// Date Picker
    
    @IBAction func DatePickeractionButton(sender: AnyObject) {
        
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        datePicker.datePickerMode = UIDatePickerMode.Date
        DatePickerTextOutLet.inputView = datePicker
//        datePicker.addTarget(self, action: "datePickerChanged:", forControlEvents: .ValueChanged)
        BirthDate = DatePickerTextOutLet.text!
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 216/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        datePicker.setValue(UIColor.redColor(), forKeyPath: "textColor")
        datePicker.backgroundColor = UIColor.whiteColor()
        
        // Adds the buttons
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "doneClick")
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "cancelClick")
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        // Adds the toolbar to the view
        DatePickerTextOutLet.inputView = datePicker
        DatePickerTextOutLet.inputAccessoryView = toolBar
//        print(BirthDate)
        
    }
    func doneClick() {
        print(datePicker.date.age)
        if ((datePicker.date.age) >= 9460800 && (datePicker.date.age) <= 42048000 ){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.dateFormat = "dd/MM/yyyy"
        DatePickerTextOutLet.text = dateFormatter.stringFromDate(datePicker.date)
        DatePickerTextOutLet.resignFirstResponder()
        }
        else if ((datePicker.date.age) <= 9460800 ){
             alertWithTitle("Go Home", message: "You are To young my Child", ViewController: self, toFocus: DatePickerTextOutLet)
        } //younger than 18 Years Old
        else if ((datePicker.date.age) >= 42048000 ){
            alertWithTitle("Sorry Sir", message: "You are to Old for This Shit", ViewController: self, toFocus: DatePickerTextOutLet)

        }// older than 80 Years Old
    }
    
    func cancelClick() {
        DatePickerTextOutLet.resignFirstResponder()
    }

    ///////// Date Picker End
    func WebGetValue(url:String,indexx : String,NatIDd:String,LanguageIndex:String,LanguageIDNum : String){
        
        Alamofire.request(.GET, url )
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
                          
                                if indexx.isEmpty{
                                    let LGetter  = collection[LanguageIndex] as! NSString
                                    self.PreferedLanguagesResult.append(LGetter as String)
                                    let LIDGetter = collection[LanguageIDNum] as!Int
                                    self.LanguageIDGetter.append(LIDGetter as Int)

                                }else if LanguageIndex.isEmpty {
                                    let NGetter = collection[indexx ] as! String
                                    let IDGetter = collection[NatIDd] as!Int
                                    
                                    self.NationalityIDResults.append(NGetter as String)
                                    self.IDGEtter.append(IDGetter as Int)
                                    
                                    //                                self.dic = [ collection[indexx ] as! String : collection[NatIDd] as!Int]
                                    
                                    //                                    print(self.dic)
                                }
                                
                                
                                
                            }//for loop
                            
//                            print(self.NationalityIDResults)
//                            print(self.IDGEtter)
                            
                            //                                    )
                            //                                    let cont : AnyObject? = collection["cont"]
                            
                        }}} catch let error {
                            print(error)
                }//catch
                
                
        }//do that is in almanofire
        
        
        
    }
    //    func testDic(){
    //    for var index=0;index < self.NationalityIDResults.count; index++ {
    //    let key = self.NationalityIDResults[index];
    //    var value = self.dic[key]
    //    if value == nil{
    //    self.dic[key] = [self.IDGEtter[index]]
    //    }else{
    //    value!.append(self.IDGEtter[index])
    //    self.dic[key] = value
    //    }
    //    }
    //    print(self.dic)
    ////
    //    }

    func TestItOrLeaveIt(){
        
        for i in 0..<min(IDGEtter.count,NationalityIDResults.count) {
            dic[NationalityIDResults[i]] = IDGEtter[i]
        }
        
//        print(dic) // "[A: 1, B: 2, C: 3]
        
        
    }
    
    func TestoItOrLeaveIt(){
        
        for i in 0..<min(LanguageIDGetter.count,PreferedLanguagesResult.count) {
            languageDictioanry[PreferedLanguagesResult[i]] = LanguageIDGetter[i]
        }
        
//        print(languageDictioanry) // "[A: 1, B: 2, C: 3]
        
        
    }
    
    
    func GetTheValueFromtextFieldToTheIDVars(){
        
        
//        var LanguageIDFromText = FirstnameoutLet.text!
        let NationalityIDFromText = NationalityOutLet.text!
//        print(NationalityIDFromText)
//        print( dic[NationalityOutLet.text!])
        NatinalityID = "\(dic[NationalityOutLet.text!]!)"
      let FirstIDFromText = FirstnameoutLet.text!
//        print(FirstIDFromText)
//        print(languageDictioanry[FirstnameoutLet.text!])
        PreferedLanguage = "\(languageDictioanry[FirstnameoutLet.text!]!)"
    }
    
    
    
//    func GetTheIdValueFromTheVarsToTheURL(){
//        if NationalityOutLet.text != nil {
//            var po = [String]()
//            //        var IDVal = [Int]()
//            po += NationalityIDResults
//            //        IDVal += IDGEtter
//            let NaID = po.indexOf(NationalityOutLet.text!)
//            //        let CorrectNatID = IDVal.indexOf(Int(NaID!)!)
//            NatinalityID =  String(NaID)
//            LastnameoutLet.text = "\(NatinalityID)"
//            print(NatinalityID)
//        }else{print("empty Nat ")}
//        if FirstnameoutLet.text != nil {
//            var poo = [String]()
//            poo += PreferedLanguagesResult
//            var LangID = poo.indexOf(FirstnameoutLet.text!)
//            PreferedLanguage = String(LangID)
//            MobileOutLet.text = PreferedLanguage
//            print(PreferedLanguage)}else{print("emptyLanguagePar")}
//  
//        
//    }
    
    
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            if ( textField == self.TheRealFirstNameText){
                self.LastnameoutLet.becomeFirstResponder()
            }
            else if ( textField == self.LastnameoutLet){
                self.MobileOutLet.becomeFirstResponder()
            }
            else if ( textField == self.MobileOutLet){
                self.userNameOutLet.becomeFirstResponder()
            }
            else if ( textField == self.userNameOutLet){
                self.PassWordOutlet.becomeFirstResponder()
            }
            else if ( textField == self.PassWordOutlet){
                self.NationalityOutLet.becomeFirstResponder()
            }
            else if ( textField == self.NationalityOutLet){
                self.FirstnameoutLet.becomeFirstResponder()
            }
            else if ( textField == self.FirstnameoutLet){
                self.DatePickerTextOutLet.becomeFirstResponder()
            }
            else{
                var thereWereErrors = checkForErrors()
                if !thereWereErrors
                {
                    //conditionally segue to next screen
                }
            }
    
            return true
        }// the Should begin func
    
        func checkForErrors() -> Bool
        {
            var errors = false
            let title = "Error"
            var message = ""
            if ((TheRealFirstNameText.text?.characters.count) < 3 ) || ((TheRealFirstNameText.text?.characters.count) > 15 ) {
                errors = true
                message += "FirstName is empty :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: TheRealFirstNameText)
            }else{ WhiteBordersForTexts(TheRealFirstNameText)}
            
            if ((LastnameoutLet.text?.characters.count) < 3 ) || ((LastnameoutLet.text?.characters.count) > 15 ){
                errors = true
                message += "LastName is empty :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: LastnameoutLet)
            }else{ WhiteBordersForTexts(LastnameoutLet)}
            
            if ((MobileOutLet.text?.characters.count) < 1 ) || ((MobileOutLet.text?.characters.count) > 9 ){
                errors = true
                message += "Mobile numper is problem :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: MobileOutLet)
            }else{ WhiteBordersForTexts(MobileOutLet)}
            
            if ((userNameOutLet.text?.characters.count) < 6 ) || ((userNameOutLet.text?.characters.count) > 19){
                errors = true
                message += "UserName is empty :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: userNameOutLet)
            }else{ WhiteBordersForTexts(userNameOutLet)}
            var searchCharacter: Character = "@"
            
            if !userNameOutLet.text!.lowercaseString.characters.contains(searchCharacter) {
                errors = true
                message += "That isn't a Email format"
                alertWithTitle(title, message: message, ViewController: self, toFocus: userNameOutLet)
            }
            else {  WhiteBordersForTexts(userNameOutLet) }
            
            if ((PassWordOutlet.text?.characters.count) < 8 ) || ((PassWordOutlet.text?.characters.count) > 15 ){
                errors = true
                message += "Password must be at least 8 characters , sorry bro  :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: PassWordOutlet)
            }else{ WhiteBordersForTexts(PassWordOutlet)}
            
            if ((NationalityOutLet.text?.characters.count) < 3 ) || ((NationalityOutLet.text?.characters.count) > 14 ) {
                errors = true
                message += "Nationality is empty :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: NationalityOutLet)
            }else{ WhiteBordersForTexts(PassWordOutlet)}
            
            if (!NationalityIDResults.contains(NationalityOutLet.text!)){
                errors = true
                message += "Invalid Nationality"
                alertWithTitle(title, message: message, ViewController: self, toFocus: NationalityOutLet)
            }
            else{ WhiteBordersForTexts(NationalityOutLet)}
            
            if ((FirstnameoutLet.text?.characters.count) < 2 ) || ((FirstnameoutLet.text?.characters.count) > 9 ){
                errors = true
                message += "Language is empty :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: FirstnameoutLet)
            }else{ WhiteBordersForTexts(FirstnameoutLet)}
            
            if ((DatePickerTextOutLet.text?.characters.count) < 5 )  {
                errors = true
                message += "Birthdate  is empty :("
                alertWithTitle(title, message: message, ViewController: self, toFocus: DatePickerTextOutLet)
            }else{ WhiteBordersForTexts(DatePickerTextOutLet)}
            
            return errors
    }// CheckFor Error Func
    
            func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField) {
                let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,handler: {_ in
                    toFocus.becomeFirstResponder()
                        self.RedBordersForTexts(toFocus)
                });
                alert.addAction(action)
                ViewController.presentViewController(alert, animated: true, completion:nil)
            }
    
    func RedBordersForTexts(TextField:UITextField){
        TextField.layer.cornerRadius = 10.0
        TextField.layer.masksToBounds = true
        TextField.layer.borderColor = UIColor( red: 260/255, green: 0/255, blue:0/255, alpha: 1.0 ).CGColor
        TextField.layer.borderWidth = 4.0
    }
    func WhiteBordersForTexts(TextField:UITextField){
        TextField.layer.cornerRadius = 10.0
        TextField.layer.masksToBounds = true
        TextField.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).CGColor
        TextField.layer.borderWidth = 2.0
    }
    
    func WebServiesSire(WEBPage:String){
        Alamofire.request(.GET, WEBPage )
            .responseString { response in
                do {
                    let doc = try XMLDocument(string: response.result.value!)
                    if let root = doc.root {
                        // this should be the content within the <string></string> element
                        //                        print(root.stringValue)
                        
                        let data = root.stringValue
                        let jsson = JSON(data)
                        if data == "\"-1\"" {
                            print(data  )
                            self.alertWithTitle("error", message: "Username is taken", ViewController: self, toFocus: self.userNameOutLet)
                        }
                        else if data == "\"-2\"" {
                            print(data  )
                            self.alertWithTitle("error", message: "Mobilenumber is taken", ViewController: self, toFocus: self.MobileOutLet)
                        }
                        else    {
                            print(data  )
                            
                        }
                        
                        
                        
                    }
                } catch let error {
                    print(error)
                }//catch
        }//do that is in almanofire
    }//the WebPageFunc
}
extension NSDate {
    var age: Int {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let now = calendar.startOfDayForDate(NSDate())
        let birthdate = calendar.startOfDayForDate(self)
        let components = calendar.components(.Minute, fromDate: birthdate, toDate: now, options: [])
        return components.minute
    }
}

