//
//  UIViewController+Zeus.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/7.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

extension UIViewController{
    var statusBarHeight: CGFloat {
        
        if let window = view.window {
            let statusBarFrame = window.convertRect(UIApplication.sharedApplication().statusBarFrame, toView: view)
            return statusBarFrame.height
            
        } else {
            return 0
        }
    }
    
    var navigationBarHeight: CGFloat {
        
        if let navigationController = navigationController {
            return navigationController.navigationBar.frame.height
            
        } else {
            return 0
        }
    }
    
    var topBarsHeight: CGFloat {
        return statusBarHeight + navigationBarHeight
    }
}

// MARK: - UIStoryboard
extension UIViewController{
    class func controllerWith(storyboardName storyboardName:String,viewControllerId:String) -> UIViewController {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier(viewControllerId)
        return vc
    }
}
