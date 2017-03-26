//
//  WbHomeViewController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

//定义全局常量，尽量使用private修饰，否则到处都可以访问
private let cellId = "cellId"

class WbHomeViewController: WbBaseViewController {
    //微博数据数组
     lazy var statusList = [String]()
    
    //加载数据
    override func loadData(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { 
            for i in 0..<16{
                if self.isPullUp{
                    self.statusList.append("上拉刷新 \(i.description)")
                    
                }else{
                    self.statusList.insert(i.description, at: 0)
                }
                
            }
            self.isPullUp = false
            self.refreshControl?.endRefreshing()
            self.tableView?.reloadData();

        }
    }
    
    @objc func showFriend(){
        let vc = WbTempViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
// MARK: -表格数据源方法
extension WbHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //设置 cell
        cell.textLabel?.text = statusList[indexPath.row]
        //返回 cell
        return cell
    }
    
}

// MARK: -设置界面
extension WbHomeViewController{
    override func setupUI() {
        super.setupUI()
        //使用自定义的导航条item
        navItem.leftBarButtonItem = UIBarButtonItem.init(title: "添加好友", taget: self, action: #selector(showFriend))
        
        //注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        let image = UIImage(named:"tempImage2")
        let imgV :UIImageView = UIImageView ()
        let rect = CGRect(x:0 , y:0 ,width:200  ,height:200)
        imgV.frame =  rect
        imgV.center = self.view.center

        
//        imgV.setRoundedCornersSize(100)
        self.view .addSubview(imgV)
        imgV.image = clip(image:image!, rect: rect)
        
        self .testUIBezierPath()//测试UIBezierPath
    }
    
    //圆形图形
    func clip(image:UIImage ,rect:CGRect) ->UIImage?{
        let rect = CGRect(origin:CGPoint(),size:rect.size)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        //背景填充
        UIColor.white.setFill();
        UIRectFill(rect)
        
        //实例化一个圆形路径
        let path =  UIBezierPath(ovalIn:rect)
        //进行路径裁剪--后续的绘图都会出现在圆形路径内部，外部的全部干掉
        path.addClip()
        
        //绘图
        image.draw(in: rect);
        
        //绘制内切圆形
        UIColor.yellow.setStroke();
        path.stroke();
        
        //取得结果
        let result = UIGraphicsGetImageFromCurrentImageContext();
        
        //关闭上下文
        UIGraphicsEndImageContext();
        
        return result
        
    }
    func testUIBezierPath() {
        let startPoint = CGPoint(x:50, y:500)
        let endPoint = CGPoint(x:300, y:500)
        let controlPoint = CGPoint(x:150,y:200)
        
        let layer1 = CALayer()
        layer1.frame = CGRect(x:startPoint.x, y:startPoint.y, width:5, height:5)
        layer1.backgroundColor = UIColor.red.cgColor
        
        let layer2 = CALayer()
        layer2.frame = CGRect(x:endPoint.x, y:endPoint.y, width:5, height:5)
        layer2.backgroundColor = UIColor.red.cgColor
        
        let layer3 = CALayer()
        layer3.frame = CGRect(x:controlPoint.x, y:controlPoint.y, width:5, height:5)
        layer3.backgroundColor = UIColor.red.cgColor
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.fromValue = 0
//        animation.toValue = 1
//        animation.duration = 2
//        layer.add(animation, forKey: "")
        
        
//        let animation = CABasicAnimation(keyPath: "lineWidth")
//        animation.fromValue = 1
//        animation.toValue = 10
//        animation.duration = 2
//        layer.add(animation, forKey: "")
        
//        layer.strokeStart = 0.5
//        layer.strokeEnd = 0.5
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.fromValue = 0.5
        animation.toValue = 0
        animation.duration = 2
        let animation2 = CABasicAnimation(keyPath: "strokeEnd")
        animation2.fromValue = 0.5
        animation2.toValue = 1
        animation2.duration = 2
        layer.add(animation, forKey: "")
        layer.add(animation2, forKey: "")
        view.layer.addSublayer(layer)
        
        view.layer.addSublayer(layer1)
        view.layer.addSublayer(layer2)
        view.layer.addSublayer(layer3)
    }
    

}
