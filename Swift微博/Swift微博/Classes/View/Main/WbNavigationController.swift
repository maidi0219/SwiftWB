//
//  WbNavigationController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

class WbNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true;
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            //判断控制器类型
            if let vc = viewController as? WbBaseViewController{
                var title = "返回"
                //判断控制器的级数，只有一个控制器的时候，显示底层控制器的标题
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, taget: self, action: #selector(popBack) ,isBack : true)
            }
            
        }
        super.pushViewController(viewController, animated: true)
        
    }
    
    //返回上一级控制器
   @objc private func popBack() {
        popViewController(animated: true)
    }

}
