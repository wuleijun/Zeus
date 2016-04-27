//
//  TableHeaderView.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/27.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

@IBDesignable
class TableHeaderView: UIView {

    @IBInspectable var headerTitle:String?{
        didSet{
            titleLabel.text = headerTitle
        }
    }
    var bottomLineLeftInset:CGFloat = 10
    var lineHeight = 1/UIScreen.mainScreen().scale
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.blackColor()
        label.font = UIFont.systemFontOfSize(14)
        return label
    }()
    
    lazy var bottomLine:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.zeusBorderColor()
        return line
    }()
    
    override func didMoveToSuperview() {
        addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        addSubview(bottomLine)
        bottomLine.snp_makeConstraints { (make) in
            make.left.equalTo(bottomLineLeftInset)
            make.width.equalTo(100)
            make.height.equalTo(lineHeight)
            make.bottom.equalTo(titleLabel.snp_bottom).offset(2)
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
