//
//  departmentCollectionViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/14.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class departmentCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
   // var collectionView=UICollectionView()
    
    var dataArrayDepart=NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "高级搜索", style:  UIBarButtonItemStyle.Plain, target: self, action: "highSearch")
        
        
        dataArrayDepart=["1","2","3","4","5","6","7","8","9"]
        
        
       // collectionView.frame=self.view.frame
        
        
      //  self.view.backgroundColor=UIColor.orangeColor()
        
        
         self.automaticallyAdjustsScrollViewInsets = true
        
        
        
        makeUICollectionView()
        
       // print("haha")
        
      //  self.view.addSubview(collectionView)

        
    }
    
    func makeUICollectionView()
    {
        //  设置 layOut
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical  //滚动方向
        layout.itemSize = CGSizeMake((SCREEN_Width - 30)/4, 80)
        // 设置CollectionView
        let ourCollectionView : UICollectionView = UICollectionView(frame: CGRectMake(0, 0, SCREEN_Width, SCREEN_HEIGHT), collectionViewLayout: layout)
        ourCollectionView.delegate = self
        ourCollectionView.dataSource = self
        ourCollectionView.backgroundColor = UIColor.whiteColor()
        ourCollectionView .registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view .addSubview(ourCollectionView)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let Identifyer="cell"
        
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier(Identifyer, forIndexPath: indexPath) as! MyCollectionViewCell
        
        let indexString = String(indexPath.row)
        cell.myLabel.text = "我的小标题_" + indexString
        // 获取随机颜色
        let colorValue1 :CGFloat!  = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
        let colorValue2 :CGFloat!  = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
        let colorValue3 :CGFloat!  = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
        cell.myImageView.backgroundColor = UIColor(red: colorValue1, green: colorValue2, blue: colorValue3, alpha: 1.0)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
