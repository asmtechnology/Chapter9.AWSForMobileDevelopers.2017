//
//  LoginViewController.swift
//  AWSChat
//
//  Created by Abhishek Mishra on 07/03/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(_ sender: Any) {
        
        guard let username = self.usernameField.text,
            let password = self.passwordField.text  else {
            return
        }
        
        let userpoolController = CognitoUserPoolController.sharedInstance
        userpoolController.login(username: username, password: password) { (error) in
            
            if let error = error {
                self.displayLoginError(error: error as NSError)
                return
            }
            
            self.displaySuccessMessage()
        }
    }
    
    @IBAction func usernameDidEndOnExit(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        dismissKeyboard()
    }
    
}

extension LoginViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if let username = self.usernameField.text,
            let password = self.passwordField.text {
            
            if ((username.characters.count > 0) &&
                (password.characters.count > 0)) {
                self.loginButton.isEnabled = true
            }
        }
        
        return true
    }

}


extension LoginViewController {
    
    fileprivate func dismissKeyboard() {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    
    fileprivate func displayLoginError(error:NSError) {
        
        let alertController = UIAlertController(title: error.userInfo["__type"] as? String,
                                                message: error.userInfo["message"] as? String,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    fileprivate func displaySuccessMessage() {
        let alertController = UIAlertController(title: "Success.",
                                                message: "Login succesful!",
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { action in
            let storyboard = UIStoryboard(name: "ChatJourney", bundle: nil)
            
            let viewController = storyboard.instantiateInitialViewController()
            self.present(viewController!, animated: true, completion: nil)
        })
        
        alertController.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion:  nil)
        }
    }

}

