//
//  LoginViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/13.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

import SwiftyJSON




class LoginViewController: UIViewController {
    
    
     //logo
    
    var logoImageView=UIImageView()
    
    //文档管理系统
    var titleView=UILabel()
    
    var userNameText=UITextField()
    
    
    var pwdText=UITextField()
    
    
    var loginButton=UIButton()
    
    
    var rootVC=RootViewController()
    
    
    var mainVC=mainViewController()
    
    var showdocument=showDocumentViewController()
    
    
    var leftVC=LeftViewController()
    
    
    var alertMessage:String!
    
    var userNameView=UIView()
    
    var userNameLeftView=UIImageView()
    
    var userPwdLeftView=UIImageView()
    
    //忘记密码按钮
    
    var forgetPwdBtn=UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景色
        
        
        
        //logo
        
        logoImageView.frame=CGRect(x: 140, y: 50, width: 50, height: 50)
        
        logoImageView.image=UIImage(named: "Logo")
        
        //文档管理系统
        
        titleView.font=titleView.font.fontWithSize(30)
        
        
        titleView.textColor=UIColor.orangeColor()
        
        titleView.text="文档管理系统"
        
        titleView.frame=CGRect(x: 80, y: 150, width: 200, height: 50)
        
        userNameText.frame=CGRect(x: 20, y: 250, width: 280, height: 50)
        
        userNameText.placeholder="请输入用户名"
        
        userNameText.borderStyle=UITextBorderStyle.RoundedRect
        
        let NameLeftView:UIView=UIView(frame: CGRectMake(0, 0, 40, 40));
        
        let namePic:UIImageView=UIImageView(frame: CGRectMake(5,5, 30, 25));
        
        namePic.image=UIImage(named: "userName");
        
        NameLeftView.addSubview(namePic);
        
        print(namePic.image)
        
        userNameText.leftView=NameLeftView;
        
      userNameText.leftViewMode=UITextFieldViewMode.Always
        
 
        
        let PwdLeftView:UIView=UIView(frame: CGRectMake(0, 0, 40, 40));
        
        let PwdPic:UIImageView=UIImageView(frame: CGRectMake(5,10, 35, 20));
        
        PwdPic.image=UIImage(named: "userPwd");
        
        PwdLeftView.addSubview(PwdPic);
        
        pwdText.frame=CGRect(x: 20, y: 320, width: 280, height: 50)
        
        pwdText.leftView=PwdLeftView
        
        pwdText.leftViewMode=UITextFieldViewMode.Always
        
        
        pwdText.placeholder="请输入密码"
        
        
        pwdText.borderStyle=UITextBorderStyle.RoundedRect
        
        //登录按钮
        
        loginButton.frame=CGRect(x: 30, y: 390, width: 260, height: 50)
        
        loginButton.setTitle("登录", forState: UIControlState.Normal)
        
        loginButton.layer.cornerRadius=20
        
        loginButton.addTarget(self, action: "login_F", forControlEvents: UIControlEvents.TouchUpInside)
        
        loginButton.backgroundColor=UIColor.orangeColor()
        
        
        //忘记密码按钮
        
        
        forgetPwdBtn.frame=CGRect(x:230, y: 450, width: 100, height: 30)
        
        //forgetPwdBtn.backgroundColor=UIColor.blueColor()
        
        forgetPwdBtn.setTitle("忘记密码？", forState: UIControlState.Normal)
        
        forgetPwdBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        
        
        
        
        self.view.addSubview(logoImageView)
        
        self.view.addSubview(titleView)
        
        self.view.addSubview(userNameText)
        
        self.view.addSubview(pwdText)
        
        self.view.addSubview(loginButton)
        
        self.view.addSubview(forgetPwdBtn)
        
        
        
        
        
       
        
        self.view.backgroundColor=UIColor(red: 210, green: 238, blue: 250, alpha: 1)

        
        
    }
    
    func base64(string:String)->String
    {
    
    
       // let string1 = userNameText.text
        
        
        let date = NSDate()
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd HH:mm:ss"
        
        let strNowTime = timeFormatter.stringFromDate(date) as String
        
        print(strNowTime)
        
        
        //时间编码
        let utf8EncodeDataTime:NSData! = strNowTime.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        // 将NSData进行base64编码
        let base64EncodedTime = utf8EncodeDataTime.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        
        
        
        
        
        // print(strNowTime)
        
        // 将字符串进行UTF8编码成NSData
        let utf8EncodeData:NSData! = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        // 将NSData进行base64编码
        let base64EncodedString = utf8EncodeData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        let aaa=base64EncodedString+"_"+base64EncodedTime
        
        //最终编码
        let utf8EncodeData2:NSData! = aaa.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        // 将NSData进行base64编码
        let base64EncodedString2 = utf8EncodeData2.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        //print("encodedString: \(base64EncodedString2)")
        
        return base64EncodedString2
        

    
    
    
    
    }
    
    func requestUrl(urlString: String){
        let url: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response, data, error) -> Void in
            
            if ((error) != nil) {
                //Handle Error here
            }else{
                //Handle data in NSData type
            }
            
        })
    }
    
    func toJSONString(dict:NSDictionary?)->String{
        
        let data = try? NSJSONSerialization.dataWithJSONObject(dict!, options: NSJSONWritingOptions.PrettyPrinted)
        
        let strJson = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        return strJson! as String
        
    }
    
    
  
    func login_F()
    {
        
       let dic:[String:String] = ["username":userNameText.text!, "userpwd":pwdText.text!]
        
        let userFormation=toJSONString(dic)
        
       let sk = base64(userFormation)
        print("sk=\(sk)")
        
        
        let stringUrl:NSString=String(format: "http://10.10.10.201/mob/Main/LoginOn_Mobile/?sk=%@",sk)
        
        let url: NSURL = NSURL(string: stringUrl as String)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response, data, error) -> Void in
            
            if ((error) != nil) {
                let alertController = UIAlertController(title: "",
                    message: "获取数据失败", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: .Default, handler: {
                    action in
                    print("点击了确定")
                })
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
              
                
             self.presentViewController(alertController, animated: true, completion: nil)
            
            }else{
            
                    userName=self.userNameText.text
                    
                     self.presentViewController(self.mainVC, animated: true, completion: nil)
                }
            
                
        })
    
    
    }
    
      
       

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
