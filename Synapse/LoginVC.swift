//
//  LoginVC.swift
//  Synapse
//
//  Created by alişan dağdelen on 23.07.2017.
//  Copyright © 2017 alisandagdeleb. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldLogin: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }
    
    func setStyle() {
        txtFieldLogin.backgroundColor = UIColor.clear
        txtFieldPassword.backgroundColor = UIColor.clear
        
        let placeholderColor = UIColor.lightText
        txtFieldLogin.attributedPlaceholder = NSAttributedString(string: "Your e-mail", attributes: [NSForegroundColorAttributeName : placeholderColor])
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: "Your password", attributes: [NSForegroundColorAttributeName : placeholderColor])
    }
    
}