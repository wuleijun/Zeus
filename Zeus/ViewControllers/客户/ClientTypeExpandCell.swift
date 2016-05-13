//
//  ClientTypeExpandCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/13.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ClientTypeExpandCell: BaseTableViewCell {

    @IBOutlet weak var arrowButton: UIButton!
    
    override class func heightOfCell() -> CGFloat {
        return 60
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

extension ClientTypeExpandCell: RJExpandingTableViewCell {
    func setLoading(loading: Bool) {
        
    }
    
    func setExpandStatus(status: RJExpandStatus, animated: Bool) {
        UIView.animateWithDuration(0.5) {
            var angle: CGFloat = CGFloat(-M_PI * 2)
            var tintColor = UIColor.lightGrayColor()
            if status == .Expanded{
                angle = CGFloat(M_PI)
                tintColor = UIColor.zeusTabBarTintColor()
            }
            self.arrowButton.transform = CGAffineTransformMakeRotation(angle)
            self.arrowButton.tintColor = tintColor
        }
    }
}
