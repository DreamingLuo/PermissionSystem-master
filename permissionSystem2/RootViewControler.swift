//
//  RootViewControler.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/19.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

import SwiftyJSON

import Alamofire

class RootViewController: UIViewController,UIScrollViewDelegate {
   
    
    var department1=""
    var department2=""
    var department3=""
    var department4=""
    var department5=""
    var department6=""
    var department7=""
    var department8=""
    var department9=""
    var department10=""
    var department11=""
    var department12=""
    var department13=""
    var department14=""
    var department15=""
    var department16=""
    var department17=""
    var department18=""
    var department19=""
    var department20=""
   // var department21=""

    
    var panGesture: UIPanGestureRecognizer!
    
    
    var distanceOfLeftView: CGFloat = 50

    
     var blackCover: UIView!
    
    
    
    
  var homeNavigationController: UINavigationController!
    
    //登录页面传过来的url
    
    
    var LoginUser:String!
    
    var centerOfLeftViewAtBeginning: CGPoint!
    //排序方法的button和icon
    
    
    var sortView=UIView()
    
    var sortName=UIButton()
    
    var sortSize=UIButton()
    
    var sortCreateTime=UIButton()
    
    var sortUpdateTime=UIButton()
    
    
    var sortNameIcon=UIImageView()
    
    var sortSizeIcon=UIImageView()
    
    var sortCreateTimeIcon=UIImageView()
    
    var sortUpdateTimeIcon=UIImageView()
   
    
    var v1 = showPeopleViewController()
    var v2 = showPeopleViewController1()
    var v3 = showPeopleViewController2()
    var v4 = showPeopleViewController3()

    var v5 = showPeopleViewController4()
    var v6 = showPeopleViewController5()
    var v7 = showPeopleViewController6()
    var v8 = showPeopleViewController7()
    var v9 = showPeopleViewController8()
    var v10 = showPeopleViewController9()
    var v11 = showPeopleViewController10()
    var v12 = showPeopleViewController11()
    var v13 = showPeopleViewController12()
    var v14 = showPeopleViewController13()
    var v15 = showPeopleViewController14()
    var v16 = showPeopleViewController15()
    var v17 = showPeopleViewController16()
    var v18 = showPeopleViewController17()
    var v19 = showPeopleViewController18()
    var v20 = showPeopleViewController19()
   // var v21 = showPeopleViewController20()

   
    
    
   

    
    var searchVC=searchViewController()
    
    
    //点击主页回到主页的手势
    var tapGesture: UITapGestureRecognizer!
    
    var leftViewController=LeftViewController()
    // 侧滑所需参数
    var distance: CGFloat = 0
    let FullDistance: CGFloat = 0.78
    let Proportion: CGFloat = 0.77
   
    var proportionOfLeftView: CGFloat = 1
    var distanceOfLeftView1: CGFloat = 50

  

   var addButton=UIButton()
    
   var addButton1=UIButton()
    
    var addButton2=UIButton()
    
    
    var create_dateUrl:NSURL!
    
    
    // 构造主视图，实现 UINavigationController.view 和 HomeViewController.view 一起缩放
    var mainView: UIView!

    
    
    var url:NSURL!

    
    var choosepeopleVC=choosePeopleViewController()
    var choosedocumentVC=chooseDocumentViewController()
    
    var ensureVC=EnsureViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
                
    //centerOfLeftViewAtBeginning = leftViewController.view.center
        
        blackCover = UIView(frame: CGRectOffset(self.view.frame, 0, 0))
        blackCover.backgroundColor = UIColor.blackColor()
        self.view.addSubview(blackCover)
        
        
        
        
       getData()
        
        self.view.backgroundColor=UIColor.whiteColor()
        
        print(SCREEN_Width)
        
        
        let img=UIImage(named: "search")
        let img1=UIImage(named: "rootAdd")
        
        let item3=UIBarButtonItem(image: img, style: UIBarButtonItemStyle.Plain, target: self, action: "search")
        
        
        let item2=UIBarButtonItem(image: img1, style: UIBarButtonItemStyle.Plain, target: self, action: "shareAndread")
        self.navigationItem.rightBarButtonItems=[item3,item2]
        
        
        
        v1.title=department1
        
        
       
        v2.title=department2
        v3.title=department3
        v4.title=department4
        v5.title=department5
        v6.title=department6
        v7.title=department7
        v8.title=department8
        v9.title=department9
        v10.title=department10
        v11.title=department11
        v12.title=department12
        v13.title=department13
        v14.title=department14
        v15.title=department15
        v16.title=department16
        v17.title=department17
        v18.title=department18
        v19.title=department19
        v20.title=department20
       // v21.title=department21

        
        let skScNavC = SKScNavViewController(subViewControllers: [v1, v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17,v18,v19,v20])
        // print(skScNavC.currentIndex)
        
        
        
        skScNavC.addParentController(self)
        

    }
    
    
    
    
    func getData()
    {
        
        //访问网络
        let url = NSURL(string:"http://10.10.10.201/mob/Main/ListDeptMenu_Mobile/?userId=guowen&sk=phiic")
        let jsonData=NSData(contentsOfURL: url!)

    
        let json=JSON(data:jsonData!)
        
        let name1=json[0]["name"].stringValue
       
        let name2=json[1]["name"].stringValue
        let name3=json[2]["name"].stringValue
        let name4=json[3]["name"].stringValue
        let name5=json[4]["name"].stringValue
        print(name5)
        let name6=json[4]["sublist"][0]["name"].stringValue
        let name7=json[4]["sublist"][1]["name"].stringValue
        let name8=json[4]["sublist"][2]["name"].stringValue
        let name9=json[4]["sublist"][3]["name"].stringValue
        let name10=json[4]["sublist"][4]["name"].stringValue
        let name11=json[5]["name"].stringValue
        let name12=json[6]["name"].stringValue

      
        let name13=json[6]["sublist"][0]["name"].stringValue
        let name14=json[6]["sublist"][1]["name"].stringValue
        let name15=json[7]["name"].stringValue
        let name16=json[8]["name"].stringValue
        let name17=json[9]["name"].stringValue
        let name18=json[10]["name"].stringValue

        let name19=json[11]["name"].stringValue

        let name20=json[12]["name"].stringValue
       // let name21=json[13]["name"].stringValue



        
        department1=name1
        department2=name2
        department3=name3
        department4=name4
        department5=name5
        department6=name6
        department7=name7
        department8=name8
        department9=name9
        department10=name10
        department11=name11
        department12=name12
        department13=name13
        department14=name14
        department15=name15
        department16=name16
        department17=name17
        department18=name18
        department19=name19
        department20=name20
       // department21=name21
        
    


    }
    
    //我的分享借阅
    func shareAndread()
    {
        
        
    
      let shareAndReadVC=shareAndReadViewController()
        
               self.navigationController?.pushViewController(shareAndReadVC, animated: true)
    
    
    
    
    }
    
    //跳转到搜索界面
    
    func search()
        {
            
            
    
    
            self.navigationController?.pushViewController(searchVC, animated: true)
    
    
    
            
        }
    


        
    
    
    
    

}