//
//  SKLaunchMenu.swift
//  SCNavController
//
//  Created by Sukun on 15/9/30.
//  Copyright © 2015年 Sukun. All rights reserved.
//

import UIKit

protocol SKLaunchMenuDelegate: NSObjectProtocol {
    
    func itemPressedWithIndex(index:Int)
}

class SKLaunchMenu: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    /**
     * 子视图控制器的title数组
     */
    var subViewTitles:NSArray!
    
    /**
     * 扩展菜单
     */
    var launchMenu:UICollectionView!
    
    /**
     * SKLaunchMenuDelegate的代理对象
     */
    weak var delegate:SKLaunchMenuDelegate?
    
    //layout属性
    private var layout:UICollectionViewFlowLayout!
    
    /**
     * 计算属性:SetLayout
     */
    var setLayout:UICollectionViewFlowLayout {
        set{
            let count:CGFloat = 4.0 //每行需要显示的Item个数
            layout = newValue
            layout.itemSize = CGSizeMake(kScreenWidth / count+5, 30)
            layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
            layout.minimumInteritemSpacing = 10
            
            layout.minimumLineSpacing = 10
            
            layout.headerReferenceSize=CGSizeMake(self.view.frame.size.width, 250); //设置collectionView头视图的大小
            
        }
        get{
            return layout
        }
    }
    //MARK: -- 初始化方法
    init(layout:UICollectionViewFlowLayout, subViewTitles:NSArray) {
        super.init(nibName: nil, bundle: nil)
        self.setLayout = layout
        self.subViewTitles = subViewTitles
        //调用创建LaunchMenu方法
        createLaunchMenu()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //调用创建LaunchMenu方法
        createLaunchMenu()
    }
    
    //MARK: -- 创建LaunchMenu
    private func createLaunchMenu() {
        let height = SCREEN_HEIGHT-100
        launchMenu = UICollectionView(frame: CGRectMake(0, kScNavBarHeight, kScreenWidth, height), collectionViewLayout: layout)
        
        launchMenu.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        
        // [launchMenu  registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewIdentifier];
        
        //        let headerLable=UILabel()
        //
        //        headerLable.frame=CGRect(x: 10, y: 5, width: 100, height: 30)
        //
        //        headerLable.text="可选部门"
        //        launchMenu.addSubview(headerLable)
        
        //      launchMenu.registerClass([MyHeaderViewclass], forSupplementaryViewOfKind: <#T##String#>, withReuseIdentifier: <#T##String#>)
        //        [launchMenugisterClass:[MyHeaderViewclass] forSupplementaryViewOfKind:UICollectionElementKindSectionHeaderwithReuseIdentifier:@"HeaderView"];
        
        launchMenu.delegate = self
        launchMenu.dataSource = self
        launchMenu.backgroundColor = UIColor.whiteColor()
        launchMenu.registerClass(SKLaunchMenuItem.self, forCellWithReuseIdentifier: "ITEM")
        self.view.addSubview(launchMenu)
    }
    
    //MARK: -- collection View delegate 方法
    
    //头视图
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize.init(width: SCREEN_Width, height: 30)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subViewTitles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ITEM", forIndexPath: indexPath) as! SKLaunchMenuItem
        let title = subViewTitles[indexPath.row] as! String
        cell.titleLabel.text = title
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        delegate?.itemPressedWithIndex(indexPath.row)
    }
    
    func collectionView(collectionView: UICollectionView, canMoveItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        var headView = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader
        {
            headView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerView", forIndexPath: indexPath)
            
            
            let headerLable=UILabel()
            
            headerLable.frame=CGRect(x: 10, y: 5, width: 100, height: 30)
            
            headerLable.text="可选部门"
            headView.addSubview(headerLable)
            
            // headView.backgroundColor = UIColor.redColor()
            
        }
        return headView
    }
    
    //MARK: -- 处理内存方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
