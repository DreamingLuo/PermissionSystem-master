//
//  LGNavigationController.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/16.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class LGNavigationController: UINavigationController {
    
    override class func initialize() {
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.whiteColor()
        navBar.tintColor = LGColor(0, g: 0, b: 0, a: 0.7)
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "slide"), style: .Plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func navigationBack() {
        popViewControllerAnimated(true)
    }
    
}
