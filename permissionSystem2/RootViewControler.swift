//
//  RootViewControler.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController,UIScrollViewDelegate {
   
    
    
   
    
    var v1 = showPeopleViewController()
    var v2 = chooseDocumentViewController()
    var v3 = EnsureViewController()
    
   var addButton=UIButton()
    
   var addButton1=UIButton()
    
    var addButton2=UIButton()
    
    
    var choosepeopleVC=choosePeopleViewController()
    var choosedocumentVC=chooseDocumentViewController()
    
    var ensureVC=EnsureViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.whiteColor()
        
        
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "搜索", style: UIBarButtonItemStyle.Plain, target: self, action: "Edit")
        
        self.navigationItem.title="权限管理系统"
        
        addButton.frame=CGRect(x: SCREEN_Width/2-25, y: SCREEN_HEIGHT-140, width: 50, height: 50)
        
        addButton.setImage(UIImage(named: "add"), forState: UIControlState.Normal)
        
        addButton.addTarget(self, action: "addPeople", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        addButton1.frame=CGRect(x: SCREEN_Width/2-25, y: SCREEN_HEIGHT-140, width: 50, height: 50)
        
        addButton1.setImage(UIImage(named: "add"), forState: UIControlState.Normal)
        
        addButton1.addTarget(self, action: "addDocument", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        addButton2.frame=CGRect(x: SCREEN_Width/2-25, y: SCREEN_HEIGHT-140, width: 50, height: 50)
        
        addButton2.setImage(UIImage(named: "add"), forState: UIControlState.Normal)
        
        addButton2.addTarget(self, action: "Ensure", forControlEvents: UIControlEvents.TouchUpInside)

        
        
        //addButton.backgroundColor=UIColor.orangeColor()
       v1.view.addSubview(addButton)
       v2.view.addSubview(addButton1)
       v3.view.addSubview(addButton2)


        
        
        v1.title="选人"
        v2.title="选文"
        v3.title="确认"
        
        
        let skScNavC = SKScNavViewController(subViewControllers: [v1, v2, v3])
      // print(skScNavC.currentIndex)
        
        
        
        skScNavC.addParentController(self)
        
         //skScNavC.mainView.delegate=self
    
               
    }
    
    func addPeople()
    {
    
    
      self.navigationController?.pushViewController(choosepeopleVC, animated: true)
    
    
    
    
    }
    
    func  addDocument()
    {
    
    
      self.navigationController?.pushViewController(choosedocumentVC, animated: true)
    
    
    
    
    }
    
    func  Ensure()
    {
    
      self.navigationController?.pushViewController(ensureVC, animated: true)
    
    
    
    }
    
    func Edit()
    {
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}