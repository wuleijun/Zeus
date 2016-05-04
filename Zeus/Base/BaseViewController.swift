//
//  BaseViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.zeusBackgroundColor()
    }
    
    /**
     隐藏导航栏阴影
     */
    func hideNavigationBarShadow() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    }
}
