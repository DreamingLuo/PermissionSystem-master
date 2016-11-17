//
//  TreeNodeTableViewCell.swift
//  TreeTableVIewWithSwift
//
//  Created by 二六三 on 15/10/24.
//  Copyright © 2015年 robertzhang. All rights reserved.
//

import UIKit


protocol TreeTableViewCellDelegate: NSObjectProtocol {
    func cellClick(text:String) //参数还没加，TreeNode表示节点
}
class TreeNodeTableViewCell: UITableViewCell{
    
    
//
   
    
    @IBOutlet weak var nodebutton: UIButton!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var nodeName: UILabel!
    @IBOutlet weak var nodeIMG: UIImageView!
    
    var delegate:TreeTableViewCellDelegate!
    
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
        
    }
    
    
 

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
