//
//  NSBundle+Extensions.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import Foundation

extension Bundle{
    var nameSpace : String{
        return (infoDictionary?["CFBundleName"] as? String ?? " ") + "."
    }
}
