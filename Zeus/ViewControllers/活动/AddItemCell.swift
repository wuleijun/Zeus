//
//  AddItemCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import XLForm

let XLFormRowDescriptorTypeAddButton = "XLFormRowDescriptorTypeAddButton"

class AddItemCell:XLFormBaseCell  {

    override static func formDescriptorCellHeightForRowDescriptor(rowDescriptor: XLFormRowDescriptor!) -> CGFloat {
        return 44
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addItem_Touch(sender: AnyObject) {
        self.formViewController().performSelector(rowDescriptor.action.formSelector)
    }
    
}
