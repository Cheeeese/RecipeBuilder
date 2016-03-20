//
//  LoginViewController.swift
//  RecipeBuilder
//
//  Created by Dorahan Arapgirlioglu on 3/19/16.
//  Copyright © 2016 Cheeeese. All rights reserved.
//

import Parse
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSignUp(sender: UIButton) {
        
        var user = PFUser()
        
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
                print("Success")
            } else {
                print("Error: \(error)")
            }
        }
        
    }

    @IBAction func didPressSignIn(sender: UIButton) {
        
        PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
               self.performSegueWithIdentifier("LoginSegue", sender: nil)
            } else {
                print("Error: \(error)")
            }
        }
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
