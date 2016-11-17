//
//  TimeSearchViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/14.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class TimeSearchViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var datePicViewStart=UIDatePicker()
    
    var datePicViewEnd=UIDatePicker()
    
    
    var startTime=UILabel()
    
    
    var endTime=UILabel()
    
    
    var uploadMonth=UILabel()
    
    var picVC=UIPickerView()
    
    var dataArrayMonth=NSArray()
    
    
    var dataArrayYear=NSArray()
    
    
    var submmitBtn=UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //另一种风格
        
         self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "切换", style:  UIBarButtonItemStyle.Plain, target: self, action: "change")
        
        
        //查询按钮
        
        

        submmitBtn.frame=CGRect(x: 250, y: SCREEN_HEIGHT-50, width: 100, height: 30)
        
        
        submmitBtn.setTitle("查询", forState: UIControlState.Normal)
        
        dataArrayMonth=["1","2","3","4","5","6","6","7","8","9","10","11","12"]
        
        
        dataArrayYear=["2009","2010","2011","2012","2013","2014","2015","2016","2017","2018"]
        
        self.navigationItem.title="按时间搜索"
        
        
        startTime.text="上传时间起:"
        
        
        startTime.frame=CGRect(x: 10, y: 150, width: 100, height: 30)
        
        endTime.text="上传时间止:"
        
        
        endTime.frame=CGRect(x: 10, y: 330, width: 100, height: 30)
        
        
        uploadMonth.text="上传月份:"
        
        uploadMonth.frame=CGRect(x: 10, y: 500, width: 100, height: 30)
        
        
        picVC.frame=CGRect(x: 100, y: 450, width: 200, height: 100)
        
        
        picVC.delegate=self
        
        picVC.dataSource=self
       
        
        
        
        
        datePicViewStart.frame=CGRect(x:110, y: 100, width: 250, height: 100)
        
        datePicViewStart.datePickerMode=UIDatePickerMode.Date
        
        
        datePicViewEnd.datePickerMode=UIDatePickerMode.Date
        
        datePicViewEnd.frame=CGRect(x: 110, y: 280, width: 250, height: 100)
        
        self.view.addSubview(datePicViewStart)
        
        self.view.addSubview(datePicViewEnd)
        
        self.view.addSubview(startTime)
        
        self.view.addSubview(endTime)
        
        self.view.addSubview(uploadMonth)
        
        self.view.addSubview(picVC)
        
        self.view.addSubview(picVC)
        
        self.view.addSubview(submmitBtn)
        
        self.view.backgroundColor=UIColor.orangeColor()
        
        
        print("haha")
        
        
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var result=""
        switch (component) {
        case 0:
            result = dataArrayYear[row] as! String
            break;
        case 1:
            result = dataArrayMonth[row] as! String
            break;
            
        default:
            break;
        }
        return result;
    
      
    
    
    }
    
    func change()
    {
    
      
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

