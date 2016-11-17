//
//  DocumentTableViewCell.swift
//  permissionSystem2
//
//  Created by phiic on 16/10/9.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var filePath: UILabel!
    @IBOutlet weak var userHeader: UIImageView!
    @IBOutlet weak var documentIIcon: UIImageView!
    @IBOutlet weak var documentSize: UILabel!
    @IBOutlet weak var uploadTime: UILabel!
    @IBOutlet weak var uploaddetailTime: UILabel!
    @IBOutlet weak var uploadName: UILabel!
 
    @IBOutlet weak var documentName: UILabel!
        override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
            
          
           userHeader.layer.cornerRadius=10
            userHeader.layer.masksToBounds=true
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
