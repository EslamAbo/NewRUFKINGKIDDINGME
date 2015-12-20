//
//  CoolClass.swift
//  RUFKingKiddingme
//
//  Created by killvak on 12/3/15.
//  Copyright © 2015 killvak. All rights reserved.
//

import Foundation
import Alamofire
import Fuzi


class CoolClass {
    
    var POP : String = ""
    var testo = [Any]()
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
                        if data == "\"-1\"" {}
                        
                        
                        
                        
                    }
                } catch let error {
                    print(error)
                }//catch
        }//do that is in almanofire
    }//the WebPageFunc
    
    
}