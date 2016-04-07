//
//  ProfileViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import YYCategories

class ProfileViewController: BaseViewController {
    @IBOutlet weak var infoView: CellBaseContainerView!
    @IBOutlet weak var infoViewBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarHeight:CGFloat = 50.0 + 64.0
        infoViewBottomConstraint.constant = view.height-tabBarHeight-infoView.height+1

        infoView.tapAction = { [weak self] in
            self?.performSegueWithIdentifier("showInfoViewController", sender: nil)
        }
    }
}
