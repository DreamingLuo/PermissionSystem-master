//
//  AppDelegate.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController:MMDrawerController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
               
       // NSThread .sleepForTimeInterval(5.0)
        self.window=UIWindow(frame:UIScreen.mainScreen().bounds)
        
        print(NSUserDefaults.standardUserDefaults().boolForKey(LGFirstLaunch))
        // 检测用户是不是第一次启动
        if !NSUserDefaults.standardUserDefaults().boolForKey(LGFirstLaunch) {
            // 是第一次启动
            window?.rootViewController = GuideViewController()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: LGFirstLaunch)
        } else {
            let tabBarController = RootTabbarController()
            
            window?.rootViewController = tabBarController
        }
        window?.makeKeyAndVisible()
        
        return true

//        let rootTabbarVC = RootTabbarController()
//        
//       // let GuideVC=GuideViewController()
//        self.window?.rootViewController=rootTabbarVC
//        self.window?.makeKeyAndVisible()
//        
//        return true

//        let root  = RootViewController()
//        //创建窗口
//        let mainFrame = UIScreen.mainScreen().bounds
//        window = UIWindow(frame: mainFrame)
//        
//        
//        let leftViewController = LeftViewController()
//        
//        //let leftNaVc=UINavigationController(rootViewController:leftViewController)
//        
//        //设置视图
//       
//        //let centerViewController = CenterViewController()
//        
//        let centerNavigationController = UINavigationController(rootViewController: root)
//        //let leftNavigationController = UINavigationController(rootViewController: leftViewController)
//        
//        drawerController = MMDrawerController(centerViewController: centerNavigationController, leftDrawerViewController: leftViewController )
//        
//          
//        
//        drawerController.maximumLeftDrawerWidth = SCREEN_Width * 0.70
//        //手势
//        drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
//        drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
//        
//        //设置动画，这里是设置打开侧栏透明度从0到1
//        drawerController.setDrawerVisualStateBlock { (drawerController, drawerSide, percentVisible) -> Void in
//            
//            var sideDrawerViewController:UIViewController?
//            if(drawerSide == MMDrawerSide.Left){
//                sideDrawerViewController = drawerController.leftDrawerViewController;
//            }
//            sideDrawerViewController?.view.alpha = percentVisible
//        }
//        //设置根试图
//        self.window?.rootViewController = drawerController
//        //设置可见
//        window?.makeKeyAndVisible()
//        return true
//        
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

