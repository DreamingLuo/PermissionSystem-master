//
//  searchFileViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

import SwiftyJSON

class searchFileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var filesTableView=UITableView()
    
    
    var departments:[String]=[]
    
    
    
    var jsonFile:JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        
        filesTableView.delegate=self
        filesTableView.dataSource=self
        
        departments=["总经办","管理办公室","行政办公室","财务部","信息部","行业统计部","数据管理部","处方项目部","医院项目部","信息部专家组","政策研究部","开发部","产品部","技术部","资源扩展部","咨询部","医药地理","医药工业","临床药物","会议部","市场部"]
        
        
        filesTableView.frame=self.view.frame
        
        self.view.addSubview(filesTableView)
        self.view.backgroundColor=UIColor.orangeColor()
        
        
        print("haha")
        
        
        
    }
    //根据部门ID拿到部门下的文件夹信息
   // http://10.10.10.201/doc/Main/ListDocSup_Mobile/?fk_bizId=c_gDoc&fk_id=9A8728EE-37DA-4E5E-A68E-E528A85C9C2A&sk=phiic
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let url = NSURL(string:"http://10.10.10.201/mob/Main/ListDeptMenu_Mobile/?userId=guowen&sk=phiic")
        let jsonData=NSData(contentsOfURL: url!)
        
        
        let json=JSON(data:jsonData!)
        
       
        
        
        switch indexPath.row{
        case 0:
             fk_idURL=json[0]["id"].stringValue
        case 1:
            fk_idURL=json[1]["id"].stringValue
        case 2:
            fk_idURL=json[2]["id"].stringValue
        case 3:
            fk_idURL=json[3]["id"].stringValue
        case 4:
            fk_idURL=json[4]["id"].stringValue
        case 5:
           fk_idURL=json[4]["sublist"][0]["id"].stringValue

        case 6:
            fk_idURL=json[4]["sublist"][1]["id"].stringValue

        case 7:
            fk_idURL=json[4]["sublist"][2]["id"].stringValue

        case 8:
           fk_idURL=json[4]["sublist"][3]["id"].stringValue

        case 9:
            fk_idURL=json[4]["sublist"][4]["id"].stringValue

        case 10:
            fk_idURL=json[5]["id"].stringValue
        case 11:
            fk_idURL=json[6]["id"].stringValue
        case 12:
            fk_idURL=json[6]["sublist"][0]["id"].stringValue
        case 13:
            fk_idURL=json[6]["sublist"][1]["id"].stringValue
        case 14:
            fk_idURL=json[7]["id"].stringValue
        case 15:
            fk_idURL=json[8]["id"].stringValue
        case 16:
            fk_idURL=json[9]["id"].stringValue
        case 17:
            fk_idURL=json[10]["id"].stringValue
        case 18:
           fk_idURL=json[11]["id"].stringValue
        case 19:
           fk_idURL=json[12]["id"].stringValue
        case 20:
            fk_idURL=json[13]["id"].stringValue

        default:
            print("出错")
        }
        
        let  fileListVC=fileListViewController()

        self.navigationController?.pushViewController(fileListVC, animated: true)
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return departments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let Identifyer="cell"
        
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: Identifyer)
        
        cell.textLabel?.text=departments[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}