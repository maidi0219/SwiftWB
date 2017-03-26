//
//  UILabel+Extensions.swift
//  Swift微博
//
//  Created by LXL on 2016/10/16.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import Foundation
extension UILabel{
    func setupLabel(_ title:NSString = "", font:CGFloat ,color:UIColor)->UILabel{
        self.text = title as String
        self.font = UIFont.systemFont(ofSize:font)
        self.textColor = color
        return self
    }

    
}
