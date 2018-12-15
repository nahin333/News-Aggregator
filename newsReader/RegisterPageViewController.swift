//
//  RegisterPageViewController.swift
//  newsReader
//
//  Created by kuet on 22/11/18.
//  Copyright © 2018 Nunev. All rights reserved.
//

import UIKit
import Firebase

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userCountryTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let userEmail = userEmailTextField.text else {return}
        guard let userPassword =  userPasswordTextField.text else {return}
        guard let userRepeatPassword =  repeatPasswordTextField.text else {return}
        guard let userCountry =  userCountryTextField.text else {return}
        
        
        if (userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty || userCountry.isEmpty){

            displayMyAlertMessage(userMessage: "All fields must be filled");
            return;
        }

        if (userPassword != userRepeatPassword){
            displayMyAlertMessage(userMessage: "Passwords do not match. ");
            return;
        }
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { (authResult, error) in
            // ...
            guard let user = authResult?.user else {
                return;
            }
        }
        self.navigationController?.popViewController(animated: true);
        self.dismiss(animated: true, completion: nil);
        
        

//        UserDefaults.standard.set(userEmail,forKey:"userEmail");
//        UserDefaults.standard.set(userPassword,forKey:"userPassword");
//        UserDefaults.standard.set(userCountry, forKey: "userCountry");
//        UserDefaults.standard.synchronize();
//
//        var myAlert = UIAlertController(title:"Alert", message:"Successfully Registered.",preferredStyle: UIAlertControllerStyle.alert);
//        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default){
//            action in
//            self.navigationController?.popViewController(animated: true);
//            self.dismiss(animated: true, completion: nil);
//        }
//        myAlert.addAction(okAction);
//        self.present(myAlert, animated: true,completion:nil);
    }
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message:userMessage,preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default,handler:nil);
        myAlert.addAction(okAction);
        self.present(myAlert,animated:true,completion:nil);
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
