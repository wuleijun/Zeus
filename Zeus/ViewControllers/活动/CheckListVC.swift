//
//  CheckListVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/9.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 名单查看
class CheckListVC: BaseViewController {

    @IBOutlet weak var progressHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var topView: UIView! {
        didSet{
            topView.backgroundColor = UIColor.zeusNavigationBarTintColor()
        }
    }
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        hideNavigationBarShadow()
        progressHeightConstraint.constant = ZeusConfig.CommonUI.progressViewHeight
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0) { 
            self.progressView.progress = 0.5
            self.progressView.layoutIfNeeded()
        }
    }

}
