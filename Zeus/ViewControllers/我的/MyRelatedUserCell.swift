//
//  MyRelatedUserCell.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/14.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class MyRelatedUserCell: UITableViewCell {
    
    @IBOutlet weak var relatedEachOtherFlag: UIImageView!
    @IBOutlet private weak var userName_Lbl: UILabel!
    @IBOutlet private weak var mobile_Lbl: UILabel!
    @IBOutlet private weak var headImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
