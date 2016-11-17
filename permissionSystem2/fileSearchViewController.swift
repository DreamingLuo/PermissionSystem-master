//
//  searchViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/10.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit
import SwiftyJSON

class fileSearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UISearchResultsUpdating{
    
    var tableView=UITableView()
    let  cellIdentifier="Cell"
    
    var array:[String]=[]
    
    var json:JSON!
    
    
    var departmentFileVC=departmentFileViewController()
    
    
    
    var showDocument=showDocumentViewController()
    
    
    
    var countrySearchController = UISearchController()
    
    
    
    var searchArray:[String] = [String](){
        didSet  {self.tableView.reloadData()}
        
    }
    
    override func viewDidLoad() {
        
        
        
        
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "高级搜索", style:  UIBarButtonItemStyle.Plain, target: self, action: "highSearch")
        
        
        
        getData()
        let nib = UINib(nibName: "DocumentTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        self.tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        
        
        super.viewDidLoad()
        
        
        
        
        tableView.frame=self.view.frame
        
        
        
        tableView.delegate=self
        tableView.dataSource=self
        
        self.view.addSubview(tableView)
        
        self.view.backgroundColor=UIColor.orangeColor()
        
        
        print("haha")
        
        
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            //controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .Minimal
            controller.searchBar.sizeToFit()
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }
    
    
    
    func  highSearch()
    {
        
        self.navigationController?.pushViewController(departmentFileVC, animated: true)
        
        
        
        
    }
    
    
    func getData()
    {
        //访问网络
        let url = NSURL(string:"http://10.10.10.201/mob/Main/ListDoc_Mobile/?rows=10&page=3&userId=guowen&sk=phiic")
        let jsonData=NSData(contentsOfURL: url!)
        
        
        // let json1=JSON(data:jsonData!)
        
        json=JSON(data: jsonData!)
        
        
        print(json)
        
        for i in 0...json["rows"].count {
            
            array.append(json["rows"][i]["name"].stringValue)
            
            
        }
        
        print(array)
        
        
        
        
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell=tableView.cellForRowAtIndexPath(indexPath)
        
        
        for i in 0...json["rows"].count {
            if json["rows"][i]["name"].stringValue==cell?.textLabel?.text {
                
                
                showDocument.url=prefixUrl+json["rows"][i]["url"].stringValue
                
                
                self.navigationController?.pushViewController(showDocument, animated: true)
                
                
            }
        }
        
        
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.countrySearchController.active {
            return self.searchArray.count
        } else {
            return self.array.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let Identyfier="cell"
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: Identyfier)
        if self.countrySearchController.active{
            cell.textLabel?.text = self.searchArray[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = self.array[indexPath.row]
            return cell
        }
        
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        
        self.searchArray = self.array.filter { (school) -> Bool in
            
            return school.containsString(searchController.searchBar.text!)
            //  return school.contains(searchController.searchBar.text!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}