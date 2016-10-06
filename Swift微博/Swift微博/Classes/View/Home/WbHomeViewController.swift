//
//  WbHomeViewController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

class WbHomeViewController: WbBaseViewController {

    @objc func showFriend(){
        let vc = WbTempViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension WbHomeViewController{
    override func setupUI() {
        super.setupUI()
//        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "好朋友s", style: .plain, target: self, action: #selector(showFriend))
        
        //使用自定义的导航条item
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "添加好友", taget: self, action: #selector(showFriend))
    }

}
