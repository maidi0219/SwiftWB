//
//  WbBaseViewController.swift
//  Swift微博
//
//  Created by LXL on 16/10/3.
//  Copyright © 2016年 com.cnit. All rights reserved.
//

import UIKit

class WbBaseViewController: UIViewController {
    
    var tableView: UITableView?
    
    var refreshControl:UIRefreshControl?
    
    var isPullUp:Bool = false

    var isLogin = false
    
    var visitorViewDic : [String :String]?
    
    
    
    //自定义导航条
    lazy var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    
     //自定义导航条条目
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        
    }
    //重写title的didSet方法
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    //加载数据 具体有子类实现
    func loadData(){
        refreshControl?.endRefreshing()
    }
}

extension WbBaseViewController{
    func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        let color: UIColor = UIColor.random();
        view.backgroundColor = color
        setupNaviBar(color: color)
        isLogin ? setupTableView() : setupVisitorView()

        
    }
    func setupNaviBar(color: UIColor) {
        //添加导航条
        view .addSubview(navBar)
        //将item 添加到导航条
        navBar.items = [navItem]
        navBar.barTintColor = UIColor.mColor(forHex: 0xF6F6F6)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: color]
        
    }
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.contentInset = UIEdgeInsetsMake(navBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        view .insertSubview(tableView!, belowSubview: navBar)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView?.addSubview(refreshControl!)
        
    }
    func setupVisitorView()  {
        let visitorView = WbVisitorView(frame:view.bounds)
        visitorView.visitorViewDic = visitorViewDic as [NSString : NSString]?
        view .insertSubview(visitorView, belowSubview: navBar)
        
    }

}

extension WbBaseViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        let count = tableView.numberOfRows(inSection: section)
        if row == (count - 1) && !isPullUp {
            print("上啦")
            isPullUp = true
            loadData()
        }
        
        
    }
}
