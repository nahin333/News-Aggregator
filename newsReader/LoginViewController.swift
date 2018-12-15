//
//  LoginViewController.swift
//  newsReader
//
//  Created by kuet on 22/11/18.
//  Copyright © 2018 Nunev. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let userEmail = userEmailTextField.text else {return}
        guard let userPassword =  userPasswordTextField.text else {return} 
        
//        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
//        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { (authResult, onSuccess) in
            // ...
            self.navigationController?.popViewController(animated: true);
            self.dismiss(animated: true, completion: nil);
        }
        
        
//        if (userEmailStored == userEmail){
//            if (userPasswordStored == userPassword){
//                UserDefaults.standard.set(true,forKey: "isUserLoggedIn");
//                UserDefaults.standard.synchronize();
//                self.navigationController?.popViewController(animated: true);
//                self.dismiss(animated: true, completion: nil);
//            }
//            else
//            {
//                displayMyAlertMessage(userMessage: "Wrong password entered !!! ");
//            }
//        }
//        else{
//            displayMyAlertMessage(userMessage: "Invalid Email");
//        }
    }
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default,handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert,animated: true,completion: nil);
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
