//
//  SearchHeaderView.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/15.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class SearchHeaderView: UIButton {

    typealias TapAction = () -> Void
    
    var tapAction:TapAction?
    
    init(title:String?,tapAction:TapAction) {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor.zeusBorderColor()
        self.setTitle(title, forState: .Normal)
        addTarget(self, action: #selector(item_Touched), forControlEvents: .TouchUpInside)
        self.tapAction = tapAction
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func item_Touched() {
        tapAction?()
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
