//
//  choosePeople.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class EnsureViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView=UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor=UIColor.orangeColor()
        
        tableView.frame=self.view.bounds
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
        
        
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let  cellIdentifier="Cell1"
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: cellIdentifier)
        
        cell.textLabel?.text="这里是一些数据"
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}