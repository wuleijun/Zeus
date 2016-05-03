//
//  SeprateView.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

@IBDesignable
class SeprateView: UIView {

    @IBInspectable var lineHeight: CGFloat = 1 / UIScreen.mainScreen().scale
    @IBInspectable var seprateLineColor: UIColor = UIColor.lightGrayColor()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        snp_updateConstraints { (make) in
            make.height.equalTo(lineHeight)
        }
        backgroundColor = seprateLineColor
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
