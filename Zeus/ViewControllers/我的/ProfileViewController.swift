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
    @IBOutlet weak var settingsView: CellBaseContainerView!
    
    @IBOutlet weak var myRelatedUserView: CellBaseContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        infoViewBottomConstraint.constant = view.height-topBarsHeight+1

        infoView.tapAction = { [weak self] in
            self?.performSegueWithIdentifier("showInfoViewController", sender: nil)
        }
        
        myRelatedUserView.tapAction = { [weak self] in
            self?.performSegueWithIdentifier("showMyRelatedUserVC", sender: nil)
        }
        
        settingsView.tapAction = { [weak self] in
            self?.performSegueWithIdentifier("showSettingsViewController", sender: nil)
        }
    }
}
