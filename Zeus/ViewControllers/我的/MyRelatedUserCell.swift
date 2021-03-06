//
//  MyRelatedUserCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/14.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/**
 类型
 
 - Nomal:            正常
 - RelatedEachOther: 互相关联（含有互相关联的图标）
 - HasAddButton:     搜索结果，含有添加按钮
 */
enum RelatedUserCellType {
    case Nomal
    case RelatedEachOther
    case HasAddButton
}


protocol MyRelatedUserCellDelegate:class {
    func relatedUserCellDidTouchUser()
}

class MyRelatedUserCell: BaseTableViewCell {

    @IBOutlet private weak var addButton: UIButton! {
        didSet{
            addButton.hidden = true
            addButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        }
    }
    @IBOutlet private weak var relatedEachOtherFlag: UIImageView!
    @IBOutlet private weak var userName_Lbl: UILabel!
    @IBOutlet private weak var mobile_Lbl: UILabel!
    @IBOutlet private weak var headImageView: UIImageView!
    
    weak var delegate:MyRelatedUserCellDelegate?
    
    var cellType:RelatedUserCellType = .Nomal {
        didSet{
            self.relatedEachOtherFlag.hidden = cellType != .RelatedEachOther
            self.addButton.hidden = cellType != .HasAddButton
        }
    }
    
    
    @IBAction func addButton_Touch(sender: AnyObject) {
        delegate?.relatedUserCellDidTouchUser()
    }
    
    override class func heightOfCell()->CGFloat {
        return 80
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
