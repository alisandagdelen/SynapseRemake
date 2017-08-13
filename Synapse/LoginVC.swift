//
//  LoginVC.swift
//  Synapse
//
//  Created by alişan dağdelen on 23.07.2017.
//  Copyright © 2017 alisandagdeleb. All rights reserved.
//

import UIKit
import KDCircularProgress

class LoginVC: BaseVC {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnSignIn: ADButton!
    
    var progress: KDCircularProgress!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }
    
    @IBAction func actsignIn(_ sender: ADButton) {
        animateButton(true)
        login()
    }
    
    func login() {
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
            
            DataService.sharedInstance.login(email, password: password, result: { (users:User?, error:Error?) in
                
            })
            DataService.sharedInstance.login(email, password: password) { (success, error) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                    self.handleLogin((success != nil))
                })
            }
        }
    }
    
    func setStyle() {
        
        txtFieldEmail.backgroundColor = UIColor.clear
        txtFieldPassword.backgroundColor = UIColor.clear
        
        let placeholderColor = UIColor.lightText
        txtFieldEmail.attributedPlaceholder = NSAttributedString(string: "Your e-mail", attributes: [NSForegroundColorAttributeName : placeholderColor])
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: "Your password", attributes: [NSForegroundColorAttributeName : placeholderColor])
    }
    
    func animateButton(_ start:Bool) {
        if !start {
            UIApplication.shared.endIgnoringInteractionEvents()
            progress.removeFromSuperview()
        }
        UIButton.animate(withDuration: 0.3, animations: {
            let animateType = start ? CGAffineTransform(scaleX: 0.1, y: 1) : .identity
            self.btnSignIn.transform = animateType
        }) { (complete) in
            if start {
                self.initProgressCircle()
            }
        }
    }
    
    func createProgressCircle() {
        progress = KDCircularProgress(frame: CGRect(x: btnSignIn.center.x, y: btnSignIn.center.y, width: 65, height: 65))
        progress.center = CGPoint(x: btnSignIn.center.x, y: btnSignIn.center.y)
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.roundedCorners = true
        let progressColor = UIColor(red: 60.0/255.0, green: 159.0/255.0, blue: 23.0/255.0, alpha: 1)
        progress.progressInsideFillColor = progressColor
        progress.trackColor = progressColor
        progress.set(colors: UIColor.white ,UIColor.white, UIColor.white, UIColor.white, UIColor.white)
        view.addSubview(progress)
    }
    
    func initProgressCircle() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        if progress == nil {
            createProgressCircle()
        } else if progress.superview == nil {
            self.view.addSubview(progress)
        }
        
        animateProgressCircle()
    }
    
    func animateProgressCircle() {
        progress.animate(fromAngle: 0, toAngle: 360, duration: 1.5) { completed in
            if completed {
                self.progress.angle = -200
                self.animateProgressCircle()
            }
        }
    }
    
    func handleLogin(_ success:Bool) {
        if success {
            self.progress.set(colors: UIColor.clear)
            UIView.animate(withDuration: 0.7, animations: {
                self.progress.transform = CGAffineTransform(scaleX: 25, y: 25)
            }, completion: { (complete) in
                if complete {
                    AlertView.show(.success, "Giriş Başarılı")
                    self.performSegue(withIdentifier: "loginSuccess", sender: nil)
                }
            })
        } else {
            animateButton(false)
        }
    }
    
    @IBAction func actShowSignUpVC(_ sender: UIButton) {
        
        let registerVC = prepareVC(type:RegisterVC.self) as! RegisterVC
        registerVC.modalTransitionStyle = .flipHorizontal
        showVC(vc:registerVC)
    }
}
