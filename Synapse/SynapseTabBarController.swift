//
//  SynapseTabBarController.swift
//  Synapse
//
//  Created by alişan dağdelen on 14.08.2017.
//  Copyright © 2017 alisandagdeleb. All rights reserved.
//

import UIKit

class SynapseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SynapseTabBarController: UITabBarControllerDelegate {

    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        print(tabBarController.selectedViewController)
        return true
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(tabBarController.selectedIndex)
    }
}

