//
//  WbBaseViewController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

class WbBaseViewController: UIViewController {
    //自定义导航条
    lazy var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    
     //自定义导航条条目
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    //重写title的didSet方法
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }

}

extension WbBaseViewController{
     func setupUI() {
        let color: UIColor = UIColor.random();
        view.backgroundColor = color
        //添加导航条
        view .addSubview(navBar)
        //将item 添加到导航条
        navBar.items = [navItem]
        navBar.barTintColor = UIColor.mColor(forHex: 0xF6F6F6)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: color]
    }

}
