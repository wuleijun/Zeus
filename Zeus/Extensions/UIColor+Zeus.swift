//
//  UIColor+Zeus.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

extension UIColor{
    class func zeusTintColor() -> UIColor{
        return UIColor.whiteColor()
    }
    
    class func zeusNavigationBarTitleColor()->UIColor {
        return UIColor.whiteColor()
    }
    
    class func zeusNavigationBarTintColor()->UIColor {
        return UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
    }
    
    class func zeusTabBarTintColor()->UIColor {
        return UIColor(red: 0, green:190/255.0, blue:12/255.0, alpha: 1.0)
    }
    
    class func zeusPublishButtonBackgroundColor()->UIColor {
        return UIColor(red: 0.90, green:0.22, blue:0.21, alpha: 1.0)
    }
}