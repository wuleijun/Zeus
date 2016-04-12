//
//  BorderButton.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

@IBDesignable
class BorderButton: UIButton {

    lazy var topLineLayer:CAShapeLayer = {
        let topLayer = CAShapeLayer()
        topLayer.lineWidth = 1
        topLayer.strokeColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).CGColor
       return topLayer
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.addSublayer(topLineLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let topPath = UIBezierPath()
        topPath.moveToPoint(CGPoint(x: 0, y: 0.5))
        topPath.addLineToPoint(CGPoint(x: CGRectGetWidth(bounds), y: 0.5))
        
        topLineLayer.path = topPath.CGPath
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
