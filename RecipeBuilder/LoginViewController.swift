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

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var iconImage: UIView!
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var signInLink: UIButton!
    @IBOutlet weak var buttonsView: UIView!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var initialButtonsY: CGFloat!
    var offsetButtons: CGFloat!
    var initialIconImageY: CGFloat!
    var offsetIcon: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        signUpButton.layer.cornerRadius = 4
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        initialY = fieldsView.frame.origin.y
        offset = -55
        initialButtonsY = buttonsView.frame.origin.y
        offsetButtons = -90
        initialIconImageY = iconImage.frame.origin.y
        offsetIcon = -30
        
    }
    
    @IBAction func didTapBG(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldsView.frame.origin.y = initialY + offset
        buttonsView.frame.origin.y = initialButtonsY + offsetButtons
        iconImage.frame.origin.y = initialIconImageY + offsetIcon
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldsView.frame.origin.y = initialY
        buttonsView.frame.origin.y = initialButtonsY
        iconImage.frame.origin.y = initialIconImageY
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSignUp(sender: UIButton) {
        
        view.endEditing(true)
        self.activityIndicator.startAnimating()
        delay(1) { () -> () in
            var user = PFUser()
            
            user.username = self.usernameTextField.text
            user.password = self.passwordTextField.text
            
            user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if success {
                    self.performSegueWithIdentifier("LoginSegue", sender: nil)
                    print("Success")
                } else {
                    print("Error: \(error)")
                }
            }
        }
        
    }

    @IBAction func didPressSignIn(sender: UIButton) {
        view.endEditing(true)
        self.activityIndicator.startAnimating()
        delay(1) { () -> () in
            PFUser.logInWithUsernameInBackground(self.usernameTextField.text!, password: self.passwordTextField.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    self.performSegueWithIdentifier("LoginSegue", sender: nil)
                } else {
                    print("Error: \(error)")
                }
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
