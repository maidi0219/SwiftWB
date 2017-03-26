//
//  UIButton+Extensions.swift
//  Swift微博
//
//  Created by LXL on 2016/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import Foundation
extension UIButton{
    func setupImage(_ imgName:NSString = "", bGImgName:NSString , title:NSString = "")->UIButton{
        self.setImage(UIImage(named:imgName as String), for: UIControlState())
        self.setBackgroundImage(UIImage(named: bGImgName as String), for: UIControlState())
        self.setTitleColor(UIColor.orange, for: .normal)
        self.setTitle(title as String, for: .normal)
        return self
    }

}
