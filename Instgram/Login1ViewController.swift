//
//  Login1ViewController.swift
//  Instgram
//
//  Created by Hussain Almajed on 2/4/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit
import Parse

class Login1ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passWordField: UITextField!
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        if(passWordField.text?.isEmpty)!{
            errorHandling(typeOfError: "user name field, empty")
            
        }else{
            loginUser()
        }
    }
    
    
    @IBAction func signupButton(_ sender: UIButton) {
        if(usernameField.text?.isEmpty)!{
            errorHandling(typeOfError: "user name field, empty")
            
        }else{
            registerUser()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.password = passWordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                self.errorHandling(typeOfError: " signing up")
            } else {
                print("User Registered successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
                // manually segue to logged in view
            }
        }
    }
    
    func loginUser() {
        
        let username = usernameField.text ?? ""
        let password = passWordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            
            
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                self.errorHandling(typeOfError: " log in")
            } else  {
                print("User successfully logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
                // display view controller that needs to shown after successful login
            }
        }
    }
    
    func errorHandling(typeOfError: String){
        
        let alertController = UIAlertController(title: "Error", message: "Error in " + typeOfError, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
        // Do any additional setup after loading the view.
        
        
        
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
