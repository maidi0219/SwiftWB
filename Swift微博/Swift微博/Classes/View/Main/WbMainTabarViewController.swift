//
//  WbMainTabarViewController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit
class WbMainTabarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildController()
        setupComposeButton()
    }
//    为嘛不能用
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask{
//        return .portrait
//    }

    @objc fileprivate func composeStatus(){
        let vc : UIViewController = UIViewController()
        vc.view.backgroundColor = UIColor.random()
        present(vc ,animated: true, completion: nil)
    }
    fileprivate lazy var composeButton: UIButton = UIButton().setupImage( "tabbar_compose_icon_add",bGImgName :"tabbar_compose_button_os7")
    
}

extension WbMainTabarViewController{
    
    fileprivate func setupComposeButton(){
        let count = CGFloat((viewControllers?.count)!)
        let w = tabBar.bounds.width/count-1
//        print(composeButton.frame)//(0.0, 0.0, 0.0, 0.0)
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
//        print(composeButton.frame)//(126.0, 0.0, 68.0, 49.0)
        tabBar .addSubview(composeButton)
        composeButton .addTarget(self, action: #selector(composeStatus), for: UIControlEvents.touchUpInside)
    }
    
    fileprivate func setupChildController(){
        let array = [
            ["clsName": "WbHomeViewController" ,
                "imageName": "tabbar_home-1" ,
                "title": "首页"],
            ["clsName": "WbMessageViewController" ,
                "imageName": "tabbar_message_center" ,
                "title": "消息"],
            ["clsName": "UIViewController" ],
            
            ["clsName": "WbDiscoverViewController" ,
                "imageName": "tabbar_discover" ,
                "title": "发现"],
            ["clsName": "WbProfileViewController" ,
                "imageName": "tabbar_profile" ,
                "title": "我"]
        ]
        var vcArray : Array = [UIViewController]()
        for dic in array{
            let vc = controller(dic);
            vcArray.append(vc)
        }
        viewControllers = vcArray
    }
    
    fileprivate func controller(_ dict:[String: String]) -> UIViewController{
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.nameSpace + clsName ) as? UIViewController.Type else{
                return UIViewController()
                
        }
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named:imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes(
            [
                NSForegroundColorAttributeName: UIColor.orange,
                NSFontAttributeName: UIFont.systemFont(ofSize: 14)
            ],for: UIControlState.selected)
        let nav = WbNavigationController(rootViewController: vc)
        return nav
    }
    
}
 
