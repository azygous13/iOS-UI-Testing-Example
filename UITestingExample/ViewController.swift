//
//  ViewController.swift
//  UITestingExample
//
//  Created by Cakii on 8/22/2559 BE.
//  Copyright © 2559 Banana Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
 
    @IBAction func login() {
        let alertController = UIAlertController(title: "Success", message: "Login successfully.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
            
        if (tfUsername.text?.isEmpty)! || (tfPassword.text?.isEmpty)! {
            alertController.title = "Error"
            alertController.message = "Username and Password cannot be empty."
        } else if !(tfUsername.text == "username" && tfPassword.text == "123456") {
            alertController.title = "Error"
            alertController.message = "Username or Password incorrect."
        }
        presentViewController(alertController, animated: true, completion: nil)
    }
}

