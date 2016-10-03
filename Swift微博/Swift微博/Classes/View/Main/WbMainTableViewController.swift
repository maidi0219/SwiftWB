//
//  WbMainTableViewController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit
class WbMainTableViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
    }

}

extension WbMainTableViewController{
    private func setupChildController(){
        let array = [
            ["clsName": "WbHomeViewController" ,
                "imageName": "tabbar_home-1" ,
                "title": "首页"],
            ["clsName": "WbMessageViewController" ,
                "imageName": "tabbar_message_center" ,
                "title": "消息"],
            ["clsName": "WbDiscoverViewController" ,
                "imageName": "tabbar_discover" ,
                "title": "发现"],
            ["clsName": "WbProfileViewController" ,
                "imageName": "tabbar_profile" ,
                "title": "我"]
        ]
        var vcArray : Array = [UIViewController]()
        for dic in array{
            print(dic)
            let vc = controller(dic);
            vcArray.append(vc)
        }
        viewControllers = vcArray
    }
    private func controller(dict:[String: String]) -> UIViewController{
        guard let clsName = dict["clsName"],
            title = dict["title"],
            imageName = dict["imageName"],
            cls = NSClassFromString(NSBundle.mainBundle().nameSpace + clsName ) as? UIViewController.Type else{
                return UIViewController()
                
        }
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named:imageName + "_selected")?.imageWithRenderingMode(.AlwaysOriginal)
        let nav = WbNavigationController(rootViewController: vc)
        return nav
    }
    
}
 