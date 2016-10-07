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
        for i in 0..<10{
        statusList.insert(i.description, at: 0)
            
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
    }

}
