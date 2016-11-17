//
//  fileListViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/4.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit
import SwiftyJSON

class fileListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
  
    
    var tableView=UITableView()
    
    
    var jsonFile:JSON!
    
    var detailfileVC=DetailFileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getURL()
        
        print("fkURL:\(fk_idURL)")
        
        
        
        tableView.frame=self.view.frame
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
        
    self.view.backgroundColor=UIColor.orangeColor()
        
        self.view.addSubview(tableView)
        
        
        
     //   http://10.10.10.201/doc/Main/ListDocSup_Mobile/?fk_bizId=c_gDoc&fk_id=D237A0BA-0895-43AC-8AD0-F61876A86C2B&sk=phiic
        
        
        
        print("haha")
        
        
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonFile["total"].intValue
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Identifier="cell"
        
        
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: Identifier)
        
       cell.textLabel?.text=jsonFile["rows"][indexPath.row]["name"].stringValue
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        pid=jsonFile["rows"][indexPath.row]["id"].stringValue
        
        
        self.navigationController?.pushViewController(detailfileVC, animated: true)
        
        
    }
    
    func getURL()
    {
        
        let stringURL=String(format:
        "http://10.10.10.201/doc/Main/ListDocSup_Mobile/?fk_bizId=c_gDoc&fk_id=%@&sk=phiic",fk_idURL)
    
    
        let url = NSURL(string:stringURL)
        let jsonData=NSData(contentsOfURL: url!)
        
        
       jsonFile=JSON(data:jsonData!)
        
        
        
    print("jsonFile.count\(jsonFile.count)")
        
        
    print("jsonFile:\(jsonFile)")
        
        
        

    
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


