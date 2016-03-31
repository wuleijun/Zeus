//
//  BaseTableViewCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit


class BaseTableViewCell: UITableViewCell {

    class func heightOfCell()->CGFloat {
        return 50
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
