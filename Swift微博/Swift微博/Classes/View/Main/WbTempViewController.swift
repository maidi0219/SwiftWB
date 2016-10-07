//
//  WbTempViewController.swift
//  Swift微博
//
//  Created by LXL on 2016/10/4.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

class WbTempViewController: WbBaseViewController {
    
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第 \(navigationController?.viewControllers.count ?? 0)个"
//        appDelegate.blockRotation = true
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        let value = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        appDelegate.blockRotation = false
//        let value = UIInterfaceOrientation.portrait.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//    }
//    override func shouldAutorotate() -> Bool {
//        return false
//    }

    @objc func showNext(){
        let vc = WbTempViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension WbTempViewController{

    override func setupUI() {
        super.setupUI()
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: .plain, target: self, action: #selector(showNext))
         navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", taget: self, action: #selector(showNext))
    }

}
