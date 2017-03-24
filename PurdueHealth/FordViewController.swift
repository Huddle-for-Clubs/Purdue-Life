//
//  FordViewController.swift
//  PurdueHealth
//
//  Created by Youssef Elabd on 1/21/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class FordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var windsorLunchTableView: UITableView!
    var items: [[Item?]] = []
    var sectionTitles: [String] = []
    let baseURL = "http://api.hfs.purdue.edu/menus/v1/locations/Ford/01-10-17"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set(1,forKey: "fordMeal")
        defaults.synchronize()
        getData()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let row = indexPath.row
        
        guard let itemInfo = items[indexPath.section][row] else {
            return cell
        }
        print("\(itemInfo.name)")
        
        cell.nameLabel.text = itemInfo.name
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < sectionTitles.count {
            return sectionTitles[section]
        }
        
        return nil
    }
    
    func getData(){
        items.removeAll()
        sectionTitles.removeAll()
        Alamofire.request(baseURL,method: .get,encoding: URLEncoding.default,headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess{
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                //                print(info)
                let json = JSON(info)
                //                print(json)
                let defaults = UserDefaults.standard
                
                let mealValue = defaults.integer(forKey: "fordMeal")
                
                switch mealValue{
                case 1:
                    let lunch = json["Lunch"].arrayValue
                    
                    var i = 0
                    
                    for items in lunch{
                        //                    print(items["Name"].stringValue)
                        self.sectionTitles.append(items["Name"].stringValue)
                        let section = items["Items"].arrayValue
                        var temp: [Item?] = []
                        for eachItem in section{
                            let idvItemInfo = Item(json : eachItem)
                            temp.append(idvItemInfo)
                            //                        print("\t \(item["Name"].stringValue)")
                        }
                        self.items.append(temp)
                        i += 1
                        
                    }
                case 0:
                    let breakfast = json["Breakfast"].arrayValue
                    //                print(breakfast)
                    var i = 0
                    
                    for items in breakfast{
                        //                    print(items["Name"].stringValue)
                        self.sectionTitles.append(items["Name"].stringValue)
                        let section = items["Items"].arrayValue
                        var temp: [Item?] = []
                        for eachItem in section{
                            let idvItemInfo = Item(json : eachItem)
                            temp.append(idvItemInfo)
                            //                        print("\t \(item["Name"].stringValue)")
                        }
                        self.items.append(temp)
                        i += 1
                        
                    }
                case 2:
                    let dinner = json["Dinner"].arrayValue
                    //                print(breakfast)
                    var i = 0
                    
                    for items in dinner{
                        //                    print(items["Name"].stringValue)
                        self.sectionTitles.append(items["Name"].stringValue)
                        let section = items["Items"].arrayValue
                        var temp: [Item?] = []
                        for eachItem in section{
                            let idvItemInfo = Item(json : eachItem)
                            temp.append(idvItemInfo)
                            //                        print("\t \(item["Name"].stringValue)")
                        }
                        self.items.append(temp)
                        i += 1
                        
                    }
                default:
                    let breakfast = json["Lunch"].arrayValue
                    //                print(breakfast)
                    var i = 0
                    
                    for items in breakfast{
                        //                    print(items["Name"].stringValue)
                        self.sectionTitles.append(items["Name"].stringValue)
                        let section = items["Items"].arrayValue
                        var temp: [Item?] = []
                        for eachItem in section{
                            let idvItemInfo = Item(json : eachItem)
                            temp.append(idvItemInfo)
                            //                        print("\t \(item["Name"].stringValue)")
                        }
                        self.items.append(temp)
                        i += 1
                        
                    }
                }
                self.windsorLunchTableView.reloadData()
            }else {
                print("Error")
            }
            
        }
    }
    
    @IBAction func onLeft(_ sender: Any) {
        let defaults  = UserDefaults.standard
        let mealValue = defaults.integer(forKey: "fordMeal")
        
        switch mealValue {
        case 1:
            defaults.set(0,forKey: "fordMeal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Breakfast"
        case 0:
            defaults.set(2,forKey: "fordMeal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Dinner"
        case 2:
            defaults.set(1,forKey: "fordMeal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Lunch"
        default:
            print("error with switch")
        }
        
    }
    
    @IBAction func onRight(_ sender: Any) {
        let defaults  = UserDefaults.standard
        let mealValue = defaults.integer(forKey: "fordMeal")
        
        switch mealValue {
        case 1:
            defaults.set(2,forKey: "fordMeal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Dinner"
        case 0:
            defaults.set(1,forKey: "fordMeal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Lunch"
        case 2:
            defaults.set(0,forKey: "fordMeal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Breakfast"
        default:
            print("error with switch")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
