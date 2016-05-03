//
//  OperationCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class OperationCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let view = UIView(frame: self.frame)
        view.backgroundColor = UIColor.zeusCellSelectedBackgroundColor()
        self.selectedBackgroundView = view
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var colorTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var colorTitleLabelTextColor: UIColor = UIColor.zeusTabBarTintColor() {
        willSet {
            colorTitleLabel.textColor = newValue
        }
    }
    
    enum FontStyle {
        case Light
        case Regular
    }
    
    var colorTitleLabelFontStyle: FontStyle = .Light {
        willSet {
            switch newValue {
            case .Light:
                if #available(iOS 8.2, *) {
                    colorTitleLabel.font = UIFont.systemFontOfSize(18, weight: UIFontWeightLight)
                } else {
                    colorTitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)!
                }
            case .Regular:
                colorTitleLabel.font = UIFont.systemFontOfSize(18)
            }
        }
    }
    
    func makeUI() {
        
        contentView.addSubview(colorTitleLabel)
        colorTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let centerY = NSLayoutConstraint(item: colorTitleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: colorTitleLabel, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([centerY, centerX])
    }
    
    override var layoutMargins: UIEdgeInsets {
        set{
            
        }
        get {
            return UIEdgeInsetsZero
        }
    }
}