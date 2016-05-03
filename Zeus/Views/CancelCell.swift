//
//  CancelCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class CancelCell: UITableViewCell {

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
    
    lazy var seprateView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.zeusCellSelectedBackgroundColor()
        return view
    }()
    
    lazy var colorTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
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
        
        contentView.addSubview(seprateView)
        seprateView.snp_makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.height.equalTo(5)
        }
        
        contentView.addSubview(colorTitleLabel)
        colorTitleLabel.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(contentView)
            make.top.equalTo(seprateView.snp_bottom)
        }
    }
    
    override var layoutMargins: UIEdgeInsets {
        set{
            
        }
        get {
            return UIEdgeInsetsZero
        }
    }
}
