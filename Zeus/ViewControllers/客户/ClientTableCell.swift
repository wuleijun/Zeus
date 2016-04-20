//
//  ClientTableCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/20.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ClientTableCell: BaseTableViewCell {
    
    @IBOutlet weak var headImageView: UIImageView!
    
    override class func heightOfCell()->CGFloat {
        return 100
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
