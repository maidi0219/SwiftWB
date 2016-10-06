//
//  UIBarButtonItem+Extensions.swift
//  Swift微博
//
//  Created by LXL on 2016/10/5.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

extension UIBarButtonItem{

    convenience init(title: String, fontSize: CGFloat = 16, taget:AnyObject?, action: Selector ,isBack: Bool = false) {
        let btn : UIButton = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn .addTarget(taget, action: action, for: .touchUpInside)
        if isBack {
            let name = "navigationbar_back"
            btn .setImage(UIImage(named:name), for: .normal)
            btn .setImage(UIImage(named:name + "_highlighted"), for: .highlighted)

        }
        btn .sizeToFit()
        self.init(customView:btn)
        
    }
}
