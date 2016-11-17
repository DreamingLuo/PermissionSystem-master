//
//  GuideViewController.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/10.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
    
    
      var pageControl=UIPageControl()
      var startButton=UIButton()
        
         var scrollView=UIScrollView()
        
         let numOfPages = 3
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let frame = self.view.bounds
            
            scrollView = UIScrollView(frame: frame)
            scrollView.pagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.showsVerticalScrollIndicator = false
            scrollView.scrollsToTop = false
            scrollView.bounces = false
            scrollView.contentOffset = CGPointZero
            // 将 scrollView 的 contentSize 设为屏幕宽度的3倍(根据实际情况改变)
            scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages), height: frame.size.height)
            
            startButton=UIButton(frame:CGRect(x: SCREEN_Width/2*5-50, y: SCREEN_HEIGHT-100, width: 100, height: 30))
            
            startButton.backgroundColor=UIColor.orangeColor()
            
            startButton.setTitle("开始", forState: UIControlState.Normal)
            
            
            startButton.addTarget(self, action: "start_F", forControlEvents: UIControlEvents.TouchUpInside)
            
          //startButton.frame=CGRect(x: SCREEN_Width/2, y: SCREEN_HEIGHT-200, width: 100, height: 30)
            
            scrollView.delegate = self
            
            for index  in 0..<numOfPages {
                // 这里注意图片的命名
                let imageView = UIImageView(image: UIImage(named: "GuideImage\(index + 1)"))
                
                print("imageName\(imageView.image)")
                imageView.frame = CGRect(x: frame.size.width * CGFloat(index), y: 0, width: frame.size.width, height: frame.size.height)
                
               
                scrollView.addSubview(imageView)
            
            }
            
            scrollView.addSubview(startButton)
            
            
            self.view.insertSubview(scrollView, atIndex: 0)
            
            
            

            
            // 给开始按钮设置圆角
            startButton.layer.cornerRadius = 15.0
            // 隐藏开始按钮
            startButton.alpha = 0.0
            
           
        }
    
    func start_F()
    {
    
    
     let LoginVC  = LoginViewController()
        
        
     self.presentViewController(LoginVC, animated: true, completion: nil)
      
    
    
    
    
    
    }
    

        // 隐藏状态栏
        override func prefersStatusBarHidden() -> Bool {
            return true
        }
    }

        
        
extension GuideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)
        
        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage == numOfPages - 1 {
            UIView.animateWithDuration(0.5) {
                self.startButton.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.2) {
                self.startButton.alpha = 1.0
            }
        }
    }
}
    


