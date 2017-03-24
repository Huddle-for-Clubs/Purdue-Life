//
//  StartViewController.swift
//  PurdueHealth
//
//  Created by Youssef Elabd on 1/21/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Firebase

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onCourts(_ sender: Any) {
        self.performSegue(withIdentifier: "courtsSegue", sender: nil)
    }
    @IBAction func onSignOut(_ sender: Any) {
        do {
            try FIRAuth.auth()?.signOut()
            let storyboard = UIStoryboard(name: "Main",bundle: nil)
            
            let loginScreen = storyboard.instantiateViewController(withIdentifier: "login")
            print("hi")
            self.present(loginScreen,animated: true, completion: nil)
            
        } catch let error as NSError{
            print(error.localizedDescription)
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
