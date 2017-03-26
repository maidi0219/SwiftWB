//
//  ViewController.swift
//  Swift圆角
//
//  Created by LXL on 2016/12/17.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x:0 ,y:0 , width:160 , height:160)
        
        let imgV = UIImageView(frame:rect)
        imgV.center = view.center
        view .addSubview(imgV);
        let image = UIImage(named:"火狐截图_2016-09-07T14-51-42.207Z")
        imgV.image =  avatarImage(image:image!, size:rect.size ,backColor: view.backgroundColor)// image
//        imgV.layer.cornerRadius = 80;
//        imgV.layer.masksToBounds = true
    }
    
    func avatarImage(image:UIImage , size:CGSize ,backColor:UIColor?) -> UIImage? {
        let rect = CGRect(origin:CGPoint(),size:size)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        //背景填充
        backColor?.setFill();
        UIRectFill(rect)
        
        //实例化一个圆形路径
        let path =  UIBezierPath(ovalIn:rect)
        //进行路径裁剪--后续的绘图都会出现在圆形路径内部，外部的全部干掉
        path.addClip()
        
        //绘图
        image.draw(in: rect);
        
        //绘制内切圆形
        UIColor.yellow.setStroke();
        path.lineWidth = 2
        path.stroke();
        
        //取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭上下文
        UIGraphicsEndImageContext();
        
        return result
        
    }


}

