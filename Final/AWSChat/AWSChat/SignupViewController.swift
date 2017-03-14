//
//  SignupViewController.swift
//  AWSChat
//
//  Created by Abhishek Mishra on 07/03/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCreateAccount(_ sender: Any) {
        
    }

    @IBAction func usernameDidEndOnExit(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func emailDidEndOnExit(_ sender: Any) {
        dismissKeyboard()
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


extension SignupViewController : UITextFieldDelegate {
    
}

extension SignupViewController {
    
    fileprivate func dismissKeyboard() {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        emailField.resignFirstResponder()
    }
    
}

