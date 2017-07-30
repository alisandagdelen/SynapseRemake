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
    
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldLogin: UITextField!
    @IBOutlet weak var btnSignIn: ADButton!
    
    var progress: KDCircularProgress!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }
    
    @IBAction func actsignIn(_ sender: ADButton) {
        UIButton.animate(withDuration: 0.3, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 1)
        }) { (complete) in
            self.animateProgressCircle()
        }
    }
    
    func setStyle() {
        
        txtFieldLogin.backgroundColor = UIColor.clear
        txtFieldPassword.backgroundColor = UIColor.clear
        
        let placeholderColor = UIColor.lightText
        txtFieldLogin.attributedPlaceholder = NSAttributedString(string: "Your e-mail", attributes: [NSForegroundColorAttributeName : placeholderColor])
        txtFieldPassword.attributedPlaceholder = NSAttributedString(string: "Your password", attributes: [NSForegroundColorAttributeName : placeholderColor])
    }
    
    func createProgressCircle() {
        UIApplication.shared.beginIgnoringInteractionEvents()
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
    
    func animateProgressCircle() {
        if progress == nil {
            createProgressCircle()
        }
        progress.animate(fromAngle: 0, toAngle: 360, duration: 1.5) { completed in
            if completed {
                self.progress.angle = -200
                self.animateProgressCircle()
            }
        }
    }
    
    @IBAction func actShowSignUpVC(_ sender: UIButton) {
        
        let registerVC = prepareVC(type:RegisterVC.self) as! RegisterVC
        registerVC.modalTransitionStyle = .flipHorizontal
        showVC(vc:registerVC)
    }
}
