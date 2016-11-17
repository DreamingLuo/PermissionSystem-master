//
//  MyCollectionViewCell.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/15.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // 由于测试，先不考虑 自动布局 后期可以考虑 SnapKit
        self.myLabel.frame = CGRectMake(10, 60, frame.size.width - 20, 20)
        self.myImageView.frame = CGRectMake(10, 0, frame.size.width - 20, 60)
        
        self.contentView.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
        self.contentView .addSubview(self.myLabel)
        self.contentView .addSubview(self.myImageView)
    
}
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var myLabel:UILabel = {
        
        let label = UILabel()
        label.text = "我的小标题"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(12)
        return label
        
    }()
    
    var myImageView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGrayColor()
        return imageView
        
    }()
    
}
