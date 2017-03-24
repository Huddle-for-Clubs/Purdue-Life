//
//  Item.swift
//  PurdueHealth
//
//  Created by Youssef Elabd on 1/21/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class Item: NSObject {
    
    var name:String = ""
    
    init(json: JSON){
        name = json["Name"].stringValue
        print(name)
        
    }


}
