//
//  AppDelegate.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var blockRotation: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound,.carPlay]) { (success, error) in
                print("授权" + (success ? " 成功" : "失败"))
            }
        } else {
            // Fallback on earlier versions
        }
        window = UIWindow(frame:UIScreen.main.bounds);
        
        #if TARGET_VERSION_Free
            window?.backgroundColor = UIColor.white;
        #elseif TARGET_VERSION_Pro
            window?.backgroundColor = UIColor.red;
        #else
            print("* NO DEBUG")

        #endif

        
        window?.rootViewController = WbMainTabarViewController();
        window?.makeKeyAndVisible();
        return true
        
    }
    func application(_: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if self.blockRotation{
            return UIInterfaceOrientationMask.all
        } else {
            return UIInterfaceOrientationMask.portrait
        }
    }

    //func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
   //     return UIInterfaceOrientationMask.portrait
   // }
}
