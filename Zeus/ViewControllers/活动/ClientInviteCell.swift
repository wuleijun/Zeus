//
//  ClientInviteCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/5.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ClientInviteCell: BaseTableViewCell {

  @IBOutlet weak var innerView: UIView!
    override class func heightOfCell() -> CGFloat {
        return 140
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectedBackgroundView = nil
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if highlighted {
            innerView.backgroundColor = UIColor.zeusCellSelectedBackgroundColor()
        }else{
            innerView.backgroundColor = UIColor.whiteColor()
        }
    }
}
