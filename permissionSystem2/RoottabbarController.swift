//
//  RootTabbarController.swift
//  Frame
//
//  Created by luogang on 16/8/29.
//  Copyright (c) 2016年 luogang. All rights reserved.
//
import UIKit

class RootTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // addChildViewControllers()
       
        let mainVC=mainViewController()
        
        
       // tarbar点击换背景图片
        var image=UIImage(named: "shouye.png")
        image=image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        mainVC.tabBarItem.image=image
        var selectimage=UIImage(named: "shouye1.png")
        selectimage=selectimage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        mainVC.tabBarItem.selectedImage=selectimage
        
        mainVC.title="首页"
        let  departmentCollectionVC=departmentCollectionViewController()
     
        var imageL=UIImage(named:"luru.png")
        imageL=imageL!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        departmentCollectionVC.tabBarItem.image=imageL
        var selectimageL=UIImage(named: "luru1.png")
        selectimageL=selectimageL!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        departmentCollectionVC.tabBarItem.selectedImage=selectimageL
        
        departmentCollectionVC.title="录入"
        
        let chartVC:ChartViewController=ChartViewController()
        
        
        var imageC=UIImage(named:"tubiao.png")
        imageC=imageC!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        chartVC.tabBarItem.image=imageC
        var selectimageC=UIImage(named: "tubiao1.png")
        selectimageC=selectimageC!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        chartVC.tabBarItem.selectedImage=selectimageC
        
        chartVC.title="图表"
        
        
        let myVC:MyViewController=MyViewController()
        
        myVC.title="我的"
        var imageW=UIImage(named:"wode.png")
        imageW=imageW!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        myVC.tabBarItem.image=imageW
        var selectimageW=UIImage(named: "wode1.png")
        selectimageW=selectimageW!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        myVC.tabBarItem.selectedImage=selectimageW
        
        
        let nvc1:UINavigationController=UINavigationController(rootViewController: mainVC)
        
        let nvc2:UINavigationController=UINavigationController(rootViewController: departmentCollectionVC)
        let nvc3:UINavigationController=UINavigationController(rootViewController: chartVC)
        let nvc4:UINavigationController=UINavigationController(rootViewController: myVC)
        self.viewControllers=[mainVC,nvc2,nvc3,nvc4]
        
        
        
        
    }
    
//    private func addChildViewControllers() {
//        addChildViewController(mainViewController(), title: "首页", imageName: "shouye.png", selectedImageName: "shouye1.png")
//        addChildViewController(departmentCollectionViewController(), title: "部门", imageName: "luru.png", selectedImageName: "luru1.png")
//        addChildViewController(ChartViewController(), title: "图表", imageName: "tubiao.png", selectedImageName: "tubiao1.png")
//        addChildViewController(MyViewController(), title: "我的", imageName: "wode.png", selectedImageName: "wode.png")
//    }
//    func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImageName: String) {
//        childController.tabBarItem.image = UIImage(named: imageName)
//        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
//        childController.title = title
//        let nav = UINavigationController(rootViewController: childController)
//        addChildViewController(nav)
//    }
//    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
