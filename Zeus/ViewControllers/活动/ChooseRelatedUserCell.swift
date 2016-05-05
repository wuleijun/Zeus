//
//  ChooseRelatedUserCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/5.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ChooseRelatedUserCell: BaseTableViewCell {

   @IBOutlet weak var selectedImageView: UIImageView!
  
    override class func heightOfCell() -> CGFloat {
        return 80
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let view = UIView(frame: self.frame)
        view.backgroundColor = UIColor.clearColor()
        self.selectedBackgroundView = view
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
