//
//  LGConst.swift
//  permissionSystem2
//
//  Created by phiic on 16/11/16.
//  Copyright © 2016年 luogang. All rights reserved.
//

import Foundation


/// 第一次启动
let LGFirstLaunch = "firstLaunch"

/// RGBA的颜色设置
func LGColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}