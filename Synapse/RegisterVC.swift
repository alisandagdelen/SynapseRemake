//
//  RegisterVC.swift
//  Synapse
//
//  Created by alişan dağdelen on 26.07.2017.
//  Copyright © 2017 alisandagdeleb. All rights reserved.
//

import UIKit

class RegisterVC: BaseVC {
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actHideVC(_ sender: UIButton) {
        hideVC()
    }
    
    @IBAction func actSignUp(_ sender: UIButton) {
        signUp()
    }
    
    func signUp() {
        
        guard let email = txtEmail.text else { return }
        guard let username = txtUserName.text else { return }
        guard let password = txtPassword.text else { return }
        
        if !password.isValidPassword() {
            AlertView.show(.warning, title: "Signup Failed", subTitle: "Password must contain at least one letter and one number.")
            return
        }
        
        if username == "" {
            AlertView.show(.warning, title: "Signup Failed", subTitle: "Username can not be empty.", showCloseButton: true)
            return
        }
        
        if !email.isValidEmail() {
            AlertView.show(.warning, title: "Signup Failed", subTitle: "Invalid e-mail", showCloseButton: true)
            return
        }
        
        AlertView.show()
        DataService.sharedInstance.register(email, password: password, username: username) { (user:User?, error:Error?) in
            if let user = user {
                _ = User.saveLocal(user, isNew: false)
                self.performSegue(withIdentifier: "registerSuccess", sender: nil)
                AlertView.show(.success)
            } else {
                AlertView.show(.warning, title: "Signup Failed", subTitle: "Username already taken.", showCloseButton: true)
            }
        }
    }
}
