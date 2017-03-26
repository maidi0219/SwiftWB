
//
//  WbVisitorView.swift
//  Swift微博
//
//  Created by LXL on 2016/10/16.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit
//访客视图
class WbVisitorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func startAnimation()  {
        let animation = CABasicAnimation(keyPath:"transform.rotation")
        animation.toValue = 2 * M_PI
        animation.repeatCount = MAXFLOAT
        animation.duration = 15
        animation.isRemovedOnCompletion = false
        hourseIconView.layer.add(animation, forKey: nil)
        
    }
    var visitorViewDic: [NSString : NSString]? {
        didSet{
            guard let imageName = visitorViewDic?["iamgeName"],
                let message = visitorViewDic?["message"]
                else {
                    return
            }
            tipLabel.text = message as String
            if imageName == "" {
                return
            }
            iconView.image = UIImage(named:imageName as String)
            hourseIconView.isHidden = true

        }
    }
    fileprivate lazy var iconView: UIImageView = UIImageView(image:UIImage(named:"tabbar_home"))
    fileprivate lazy var hourseIconView: UIImageView = UIImageView(image:UIImage(named:"temIMageSmall"))
    fileprivate lazy var tipLabel: UILabel = UILabel().setupLabel(font:13 , color:UIColor.darkGray)
    fileprivate lazy var registerBUtton :UIButton = UIButton().setupImage(bGImgName: "navigationbar_button_background", title: "注册");
    fileprivate lazy var loginBUtton :UIButton = UIButton().setupImage(bGImgName: "navigationbar_button_background",title: "登录");
}

//设置界面
extension WbVisitorView{
    // extension不能有属性，不能重写本类的方法
    func setupUI(){
        backgroundColor = UIColor.white
        addSubview(iconView)
        addSubview(hourseIconView)
        addSubview(tipLabel)
        addSubview(registerBUtton)
        addSubview(loginBUtton)
        tipLabel.numberOfLines = 0
        tipLabel.textAlignment = .center
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0))



        addConstraint(NSLayoutConstraint(item: hourseIconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: hourseIconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -100))
        
        
        let margin: CGFloat = 20.0
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0));
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant:margin));
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 170));
        
        //注册
        addConstraint(NSLayoutConstraint(item: registerBUtton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: margin))
        addConstraint(NSLayoutConstraint(item: registerBUtton,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: registerBUtton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 80))
        //登录
        addConstraint(NSLayoutConstraint(item: loginBUtton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: margin))
        
        addConstraint(NSLayoutConstraint(item: loginBUtton,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: loginBUtton,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 80))

        


    }
    
}
