//
//  CellBaseContainerView.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/6.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 静态的Cell背景View
class CellBaseContainerView: UIView {

    var tapAction: (() -> Void)?
    
    lazy var backgroundButton:UIButton = {
        let button = UIButton.init(type:UIButtonType.System)
        button.addTarget(self, action: #selector(backgroundTouch), forControlEvents: .TouchUpInside)
        button.backgroundColor = UIColor.clearColor()
        return button
    }()
    
    func backgroundTouch(){
        tapAction?()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        insertSubview(backgroundButton, atIndex: 0)
        backgroundButton.snp_makeConstraints { (make) in
            make.edges.equalTo(snp_edges)
        }
        setLayerShadow(UIColor.blackColor(), offset: CGSizeZero, radius: 0.3)
    }
}
