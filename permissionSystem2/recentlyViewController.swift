//
//  recentlyViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/20.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class recentlyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var  recentlyPeoples:[String]=[]
    var  tableView=UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.orangeColor()
        
        
        recentlyPeoples=["罗刚1","罗刚2","罗刚3"]
        
        
        tableView.delegate=self
        tableView.dataSource=self
        tableView.frame=self.view.frame
        
        
        self.view.addSubview(tableView)
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentlyPeoples.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Identifyer="cell"
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: Identifyer)
        
        cell.textLabel?.text=recentlyPeoples[indexPath.row]
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}