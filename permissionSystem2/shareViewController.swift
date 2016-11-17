//
//  choosePeople.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol addPeopleProtocol:class  {
    func addPeopleToSure(people:String)
}

  var jsonFile:JSON!

class PeoplesModel: NSObject {
    
    var PeopleName = ""
    }


class shareViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //var ensureVC=EnsureViewController()
    
    //var resultVC=resultViewController()
    
    var ensureVC=EnsureViewController()
    
    var EditView=UIView()
    
    var EditButton=UIButton()
    
    var allSelectedButton=UIButton()
    
    var unAllSelectedButton=UIButton()
    
    var deleteButton=UIButton()
    
    var commitButon=UIButton()
    
    weak  var delegate: addPeopleProtocol?
    
    var tableView=UITableView()
    
    var peoples:[String]=[]
    
    var deleteArray:[String]=[]
    
    var _isAllSelected:Bool=false
    
    var commitArray:[String]=[]
    
    var message=""
    
    var deletedArray:[String]=[]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        EditButton.frame=CGRect(x: SCREEN_Width-50, y: 5, width: 40, height: 40)
        
        
        allSelectedButton.frame=CGRect(x:5, y: 5, width: 40, height: 40)
        
        unAllSelectedButton.frame=CGRect(x: 55, y: 5, width: 60, height: 40)
        
        
        allSelectedButton.setTitle("全选", forState: UIControlState.Normal)
        
        allSelectedButton.alpha=0.2
        
        unAllSelectedButton.setTitle("全不选", forState: UIControlState.Normal)
        
        unAllSelectedButton.alpha=0.2
        
        
        commitButon.frame=CGRect(x: 130, y: 5, width: 40, height: 40)
        
        commitButon.setTitle("提交", forState: UIControlState.Normal)
        
        commitButon.alpha=0.2
        
        
        getURL()

        
        //EditButton.backgroundColor=UIColor.blueColor()
        
        
        EditButton.setTitle("编辑", forState: UIControlState.Normal)
        
        
        EditButton.addTarget(self, action: "Edit", forControlEvents:UIControlEvents.TouchUpInside)
        
        //EditView.frame=CGRect(x: 100, y: 100, width:50, height: 50)
        
        EditView.frame=CGRect(x: 0, y: 0, width:50, height: 50)
        
        
        EditView.backgroundColor=UIColor.brownColor()
        
       // peoples=["罗刚1","罗刚2","罗刚3"]
        
        peoples=["姜科","张琼","华颖菲","赖树清","王田甜","陈洁","徐文遐","杨惠赟","姚燕","袁芳","华雪蔚","潘锋","曹贵","陈婉莹","李朝凤","周晓燕","陈辰","黄金才","李文雄","罗刚","曲若雷","施相悦","王莕","张丽冰","张少迪","周佳明","周正林","朱玮","王奇巍","傅毅","雷玲","潘慧敏","王佳","徐虹","赵绪韬","陈晓露","江毅杰","金雷","李洋","陶旭辉","武肖坤","张敬冬","张修宝","郑启昌","周维","卜祥媛","陈婧","江雯","李晓东","娄菁菁","王彩娟","王晓晴","王颀","朱建英","庄武","包海峰","丁伟红","唐菊红","朱义峰","刘喆","梅超群","孟洁","吴竑","周洁","陈至唯","李静一","欧阳怡","沈卫东","施厚权","施宇","王雅君","魏照寰","吴玉兰","夏怡雯","姚晓璐","音袁","袁关关","张程捷","陈斌海","刘玲玲","陆燕玲","吕士俊","钱苗苗","王盈","韦旭华","吴霖萍","纪雨辰","刘艳","何玉婵","蒋琳","苏红","宗毛毛","郭文"]
        
        deleteArray=peoples
        
        self.view.backgroundColor=UIColor.orangeColor()
        
        tableView.frame=self.view.bounds
        
        tableView.delegate=self
        tableView.dataSource=self
        
        
        
        tableView.tableHeaderView=EditView
        
        
        
        EditView.addSubview(EditButton)
        
        EditView.addSubview(allSelectedButton)
        
        EditView.addSubview(unAllSelectedButton)
        
        EditView.addSubview(deleteButton)
        
        
        EditView.addSubview(commitButon)
        self.view.addSubview(tableView)
    }
    
    
    func getURL()
    {
        
        
        
        
        let url = NSURL(string:"http://10.10.10.201/doc/Share/LendDoc_SelMbr/id=0c223b32-16fa-43e7-bfd2-6ca8b8a6bca4")
        let jsonData=NSData(contentsOfURL: url!)
        
        
        jsonFile=JSON(data:jsonData!)
        
        
       
}

    
    
    //编辑方法
    
    func  Edit()
    {
        
        allSelectedButton.alpha=1
        unAllSelectedButton.alpha=1
        
        deleteButton.alpha=1
        
        commitButon.alpha=1
        
        allSelectedButton.addTarget(self, action: "allSelected", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        unAllSelectedButton.addTarget(self, action: "unAllSelected", forControlEvents: UIControlEvents.TouchUpInside)
        
        deleteButton.addTarget(self, action: "delete", forControlEvents: UIControlEvents.TouchUpInside)
        
        commitButon.addTarget(self, action: "commit", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        if EditButton.currentTitle=="编辑" {
            
            
            
            
            EditButton.setTitle("取消", forState: UIControlState.Normal)
        }
            
        else
        {
            
            allSelectedButton.alpha=0.2
            unAllSelectedButton.alpha=0.2
            
            deleteButton.alpha=0.2
            
            commitButon.alpha=0.2
            
            EditButton.setTitle("编辑", forState: UIControlState.Normal)
            
        }
        
        if tableView.editing {
            tableView.editing=false
        }
        else
        {
            
            tableView.editing=true
            
        }
        
    }
    //全不选
    
    func unAllSelected()
    {
        
        
        for i in 0...peoples.count-1{
            
            let indexPath1=NSIndexPath(forRow: i,inSection: 0)
            
            
            
            self.tableView.deselectRowAtIndexPath(indexPath1, animated: true)
            
            
            
        }
        
    }
    
    //全选
    
    func allSelected()
    {
        
        
        
        deleteArray.removeAll()
        
        for i in 0...peoples.count-1{
            
            
            let indexPath1=NSIndexPath(forRow: i,inSection: 0)
            
            
            
            self.tableView.selectRowAtIndexPath(indexPath1, animated: true, scrollPosition: UITableViewScrollPosition.Top)
        }
        
        
        
    }
    
        //提交
    
    func commit()
    {
        
        
        
        if commitArray.count==0 {
            print("请至少选择一条数据")
            message="请至少选择一条数据"
        }
        
        if commitArray.count==1 {
            
            message=""
            message+=commitArray[0]+""
        }
        
        if commitArray.count>1 {
            message=""
            
            for i in 0...commitArray.count-1 {
                
                message += commitArray[i]+" "
            }
            
        }
        
        
        let alertController=UIAlertController(title: "你选择了", message: message, preferredStyle: .Alert)
        
        //let okAction=UIAlertAction(title: "确定", style: .Cancel, handler: nil)
        
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "确定", style: .Default,
                                     handler: {
                                        action in
                                        print("点击了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        
    }
    
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        
//        
//        if commitArray.contains(jsonFile["all"][indexPath.row]) {
//            commitArray.removeAtIndex(commitArray.indexOf(peoples[indexPath.row])!)
//        }
//            
//        else
//        {
//            
//            
//            commitArray.insert(peoples[indexPath.row], atIndex: indexPath.row)
//            
//            
//        }
//        if deleteArray.contains(peoples[indexPath.row]) {
//            print("已经有了")
//        }
//        else
//        {
//            
//            
//            deleteArray.insert(peoples[indexPath.row], atIndex: deleteArray.count)
//            
//            print(deleteArray)
//            
//            
//        }
//        
//    }
//    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        print(deleteArray)
        
        if deletedArray.contains(peoples[indexPath.row]) {
            print("haha")
        }
        else
        {
            deletedArray.insert(peoples[indexPath.row], atIndex: indexPath.row)
            
            
        }
        
        
        //deleteArray .removeAtIndex(indexPath.row)
        
        if deleteArray.contains(peoples[indexPath.row]) {
            
            
            deleteArray.removeAtIndex(deleteArray.indexOf(peoples[indexPath.row])!)
            
            print(deleteArray)
        }
        
        if commitArray.contains(peoples[indexPath.row]) {
            print("已经有了")
        }
            
        else
        {
            
            
            print(deleteArray)
            
            
            commitArray.insert(peoples[indexPath.row], atIndex: indexPath.row)
            print("commit:%@",commitArray)
            
        }
        
        
        
    }
    
    
    func  tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        
        return UITableViewCellEditingStyle.init(rawValue: UITableViewCellEditingStyle.Insert.rawValue | UITableViewCellEditingStyle.Delete.rawValue)!
        
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let  cellIdentifier="Cell1"
        //        let nib = UINib(nibName: "showPeopleTableViewCell", bundle: nil)
        //        tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        //
        //        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! showPeopleTableViewCell
        
        
        let cell=UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: cellIdentifier)
        
        
        //        cell.addButton.tag=indexPath.row
        //
        //        cell.addButton.addTarget(self, action: "addPeople:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        //    cell.showPeople.text=peoples[indexPath.row]
        
        cell.textLabel?.text=peoples[indexPath.row]
        return cell
        
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peoples.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}