//
//  UserCountLabel.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class UserCountLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        text = title
        backgroundColor = UIColor.whiteColor()
        textColor = UIColor.darkGrayColor()
        font = UIFont.systemFontOfSize(14)
        textAlignment = .Center
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
