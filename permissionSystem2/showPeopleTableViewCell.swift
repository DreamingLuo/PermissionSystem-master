//
//  showPeopleTableViewCell.swift
//  permissionSystem2
//
//  Created by phiic on 16/9/26.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit

class showPeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var showPeople: UILabel!
   
    @IBOutlet weak var addButton: UIButton!
  
   
    override func awakeFromNib() {
      
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
