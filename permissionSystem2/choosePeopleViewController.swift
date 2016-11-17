//
//  choosePeopleViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//
//
//import UIKit
//
//class choosePeopleViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
//    
//    var tableView=UITableView()
//    
//    var organizations:[String]=[]
//    
//    var recentlyVc=recentlyViewController()
//    
//    var departmentVC=departmentViewController()
//    
//    var organizationVC=organizationViewController()
//    
//    var relatedVC=relatedViewController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        organizations=["最近","部门","组织","相关"]
//        
//        
//        tableView.frame=self.view.frame
//        
//        tableView.delegate=self
//        tableView.dataSource=self
//        
//        
//        self.view.addSubview(tableView)
//        self.view.backgroundColor=UIColor.brownColor()
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return organizations.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let Identifyer="cell"
//        
//        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: Identifyer)
//        
//        cell.textLabel?.text=organizations[indexPath.row]
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        switch indexPath.row {
//        case 0:
//            self.navigationController?.pushViewController(recentlyVc, animated: true)
//        case 1:
//            self.navigationController?.pushViewController(departmentVC, animated: true)
//        case 2:
//            self.navigationController?.pushViewController(organizationVC, animated: true)
//        case 3:
//            self.navigationController?.pushViewController(relatedVC, animated: true)
//        default:
//            print("出错")
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//}
import UIKit

class choosePeopleViewController: UIViewController,TreeTableViewCellDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取资源
        let plistpath = NSBundle.mainBundle().pathForResource("DataInof", ofType: "plist")!
        let data = NSMutableArray(contentsOfFile: plistpath)
        
        // 初始化TreeNode数组
        let nodes = TreeNodeHelper.sharedInstance.getSortedNodes(data!, defaultExpandLevel: 0)
        
        // 初始化自定义的tableView
        let tableview: TreeTableView = TreeTableView(frame: CGRectMake(0, 20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-20), withData: nodes)
        
        
        
        
        tableview.allowsMultipleSelection=true
        
       
        
        
        self.view.addSubview(tableview)
    }
    
    func cellClick(text:String) {
        print(text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
