//
//  showDocumentViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/9.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class showDocumentViewController: UIViewController ,UIWebViewDelegate{
    
    
    
    
      var url:String!
      var webView=UIWebView()
    //文章标题
    var documentHeader=UILabel()
    //作者头像
    var peopleIcon=UIImageView()
    //作者名字
    var peopleName=UILabel()
    //发表文章时间
    var documentTime=UILabel()
    
    //分享按钮
    
    var shareButton=UIButton()
    
    //借阅按钮
    
    var borrowButton=UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let moreButton=UIBarButtonItem(title: "分享", style: UIBarButtonItemStyle.Plain, target: self, action: "share_F")
        
        self.navigationItem.rightBarButtonItem=moreButton
        
        
        
        documentHeader.frame=CGRect(x: 15 , y: -130, width: 200, height: 50)
        
        documentHeader.font=documentHeader.font.fontWithSize(20)
        
        
     
        
        
       peopleIcon.frame=CGRect(x: 15, y: -60, width: 40, height: 40)
        
        
        peopleIcon.image=UIImage(named: "qqIcon")
        
        peopleName.frame=CGRect(x: 60, y: -80, width: 60, height: 60)
        
       peopleName.font=peopleName.font.fontWithSize(15)
        
        documentTime.frame=CGRect(x: 60, y: -57, width: 150, height: 50)
        
       documentTime.font=documentTime.font.fontWithSize(15)
        documentTime.alpha=0.5
        
             self.view.backgroundColor=UIColor.greenColor()
        
        
      
       
     
        
        webView.frame=CGRect(x: 0, y: 0, width: SCREEN_Width, height:SCREEN_HEIGHT)
        
        webView.scrollView.contentInset=UIEdgeInsets(top: 150,left: 0,bottom: 0,right: 0)
        
        webView.backgroundColor=UIColor.whiteColor()
        
        
        webView.scalesPageToFit=true
     
        webView.delegate = self;
        
       
        
        
        webView.scrollView.addSubview(documentHeader)
        webView.scrollView.addSubview(peopleIcon)
        webView.scrollView.addSubview(peopleName)
        webView.scrollView.addSubview(documentTime)
       
       
        
      
       
       
        self.view.addSubview(webView)
        
        
    }
    
    //点击分享anniu
    
    
    func share_F()
    {
    
    
       let shareVC=shareViewController()
        
        
        self.navigationController?.pushViewController(shareVC, animated: true)
    
    
    
    
    
    }
    func more_F()
    {
    
      
    
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
