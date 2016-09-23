//
//  organizationViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/20.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class departmentViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    var departments:[String]=[]
    
    var tableView=UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        departments=["技术部","开发部","测试部"]
        
        tableView.delegate=self
        tableView.dataSource=self
        
        self.view.addSubview(tableView)
        
        tableView.frame=self.view.frame
       self.view.backgroundColor=UIColor.blueColor()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Identifyer="cell"
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: Identifyer)
        
        
        cell.textLabel?.text=departments[indexPath.row]
        
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}