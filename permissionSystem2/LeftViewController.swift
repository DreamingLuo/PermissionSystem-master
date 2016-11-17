//
//  LeftViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    
    
    var headerTitle:String!
    
    var  headerImage=UIImageView()
    
    
    var leftButton1=UIButton()
    
    var leftButton2=UIButton()
    
    var leftButton3=UIButton()
    
    var userFiles=UILabel()
    
    
    
    
    
    
    var headerButton=UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        leftButton1.frame=CGRect(x: 30, y: 200, width: 130, height: 40)
        
        
        
        leftButton1.setTitle("我的分享借阅", forState: UIControlState.Normal)
        
        
        leftButton1.alpha=0.6
        
        leftButton2.frame=CGRect(x: 30, y: 240, width: 100, height: 40)
        
        
        leftButton2.setTitle("我的文档", forState: UIControlState.Normal)
        
        leftButton2.alpha=0.6
        
        leftButton3.frame=CGRect(x: 30, y: 280, width: 100, height: 40)
        
        
        leftButton3.alpha=0.6
        leftButton3.setTitle("部门", forState: UIControlState.Normal)
        
        
        leftButton3.addTarget(self, action: "department_F", forControlEvents: UIControlEvents.TouchUpInside)
        //用户头像
        
        headerImage.frame=CGRect(x: 30, y: 100, width: 50, height:50)
        headerImage.layer.cornerRadius=30
        
        
        headerImage.image=UIImage(named: "headerIcon")
        
        //用户名字
        headerButton.frame=CGRect(x: 75, y: 60, width: 100, height: 100)
        
        
        
        headerButton.setTitle(userName, forState: UIControlState.Normal)
        
        //用户上传文件
        
        userFiles.frame=CGRect(x: 90, y: 120, width: 200, height: 30)
        
        userFiles.font=userFiles.font.fontWithSize(15)
        
        userFiles.text="已上传89个文件"
        
        
        self.view.addSubview(headerButton)
        
        self.view.addSubview(headerImage)
        
        self.view.addSubview(leftButton1)
        
        self.view.addSubview(leftButton2)
        
        self.view.addSubview(leftButton3)
        
        self.view.addSubview(userFiles)

        
        self.view.backgroundColor=UIColor(red: 58/255, green: 67/255, blue: 73/255, alpha: 1)
        
        
        print("haha")
        
        
        
    }
    
    func department_F()
    {
        
        
        
    
        
        let departmentCollectionViewVc = departmentCollectionViewController()
        
        
        
        
        self.presentViewController(departmentCollectionViewVc, animated: true, completion: nil)
    
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
