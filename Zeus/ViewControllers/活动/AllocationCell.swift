//
//  AllocationCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/4.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class AllocationCell: BaseTableViewCell {

    @IBOutlet weak var countTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func addAndReduce_Touch(sender: UIButton) {
        let currentCount = Int(countTextField.text!)
        if var currentCount = currentCount {
            currentCount = max(currentCount + sender.tag, 0)
            countTextField.text = "\(currentCount)"
        }
    }

    override class func heightOfCell() -> CGFloat {
        return 60
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
