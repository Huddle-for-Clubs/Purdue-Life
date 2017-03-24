//
//  WindsorTableView.swift
//  PurdueHealth
//
//  Created by Youssef Elabd on 1/21/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WindsorTableView: UITableView {
    
    var items: [Item?] = []
    let baseURL = "http://api.hfs.purdue.edu/menus/v1/locations/Windsor/01-10-20"
    
    override func reloadData() {
        super.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    func getMenus(){
        Alamofire.request(baseURL,method: .get,encoding: URLEncoding.default,headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess{
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                //                print(info)
                let json = JSON(info)
                //                print(json)
                
                let breakfast = json["Lunch"].arrayValue
                //                print(breakfast)
                
                for items in breakfast{
                    //                    print(items["Name"].stringValue)
                    let section = items["Items"].arrayValue
                    for eachItem in section{
                        let idvItemInfo = Item(json : eachItem)
                        self.items.append(idvItemInfo)
                        //                        print("\t \(item["Name"].stringValue)")
                    }
                    
                }
               self.reloadData()
            }else {
                print("Error")
            }
            
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let row = indexPath.row
        
        guard let itemInfo = items[row] else {
            return cell
        }
        print("\(itemInfo.name)")
        
        cell.nameLabel.text = itemInfo.name
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
