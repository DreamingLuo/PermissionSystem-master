//
//  departmentFile.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/17.
//  Copyright © 2016年 luogang. All rights reserved.
//
import UIKit

class departmentFileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var  tableView=UITableView()
    
    // var searchTimeVC=searchTimeViewController()
    
     var seatchFileVC=searchFileViewController()
    
    var searchArrays:[String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.frame=self.view.frame
        
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
        
        self.view.addSubview(tableView)
        
        
    searchArrays=["按时间搜索","按文件夹搜索"]
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print("点击")
        switch indexPath.row {
        case 0:
            let timeSearchVC=TimeSearchViewController()
            
            self.navigationController?.pushViewController(timeSearchVC, animated: true)
         
        case 1:
            self.navigationController?.pushViewController(seatchFileVC, animated: true)
        default:
            print("出错")
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArrays.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let Identifyer="cell"
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: Identifyer)
        
        cell.textLabel?.text=searchArrays[indexPath.row]
        
        
        return cell
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

