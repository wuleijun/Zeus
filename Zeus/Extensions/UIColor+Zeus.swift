//
//  UIColor+Zeus.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

extension UIColor{
    /**
     默认的View背景颜色
     
     - returns: UIColor
     */
    class func zeusBackgroundColor()->UIColor {
        return UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
    }
    
    /**
     TintColor
     
     - returns: UIColor
     */
    class func zeusTintColor() -> UIColor{
        return UIColor.whiteColor()
    }
    
    /**
     注册按钮背景
     
     - returns: UIColor
     */
    class func zeusRegisterButtonTintColor() -> UIColor {
        return UIColor(red:86/255.0,  green:148/255.0,  blue:224/255.0, alpha:1)
    }
    
    /**
     导航栏TitleColor
     
     - returns: UIColor
     */
    class func zeusNavigationBarTitleColor()->UIColor {
        return UIColor.whiteColor()
    }
    
    /**
     导航栏TintColor
     
     - returns: UIColor
     */
    class func zeusNavigationBarTintColor()->UIColor {
        return UIColor(red: 0.26, green: 0.29, blue: 0.32, alpha: 1.0)
    }
    
    /**
     Tab栏背景颜色
     
     - returns: UIColor
     */
    class func zeusTabBarTintColor()->UIColor {
        return UIColor(red: 0, green:0.74, blue:0.04, alpha: 1.0)
    }
    
    /**
     发布活动按钮背景颜色
     
     - returns: UIColor
     */
    class func zeusPublishButtonBackgroundColor()->UIColor {
        return UIColor(red: 0.90, green:0.22, blue:0.21, alpha: 1.0)
    }
    
    /**
     边界颜色
     
     - returns: UIColor
     */
    class func zeusBorderColor()->UIColor {
        return UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }
}