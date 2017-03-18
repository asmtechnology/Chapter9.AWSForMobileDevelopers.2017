//
//  HomeViewController.swift
//  AWSChat
//
//  Created by Abhishek Mishra on 07/03/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // write user's email address to console log
        let userpoolController = CognitoUserPoolController.sharedInstance
        userpoolController.getUserDetails(user: userpoolController.currentUser!) { (error: Error?, details:AWSCognitoIdentityUserGetDetailsResponse?) in
            
            if let userAttributes = details?.userAttributes {
                for attribute in userAttributes {
                    if attribute.name?.compare("email") == .orderedSame {
                        print ("Email address of logged-in user is \(attribute.value!)")
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
