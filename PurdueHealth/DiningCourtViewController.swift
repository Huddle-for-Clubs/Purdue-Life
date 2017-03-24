//
//  DiningCourtViewController.swift
//  PurdueHealth
//
//  Created by Youssef Elabd on 1/21/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class DiningCourtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onWindsor(_ sender: Any) {
        self.performSegue(withIdentifier: "windsorSegue", sender: nil)
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
