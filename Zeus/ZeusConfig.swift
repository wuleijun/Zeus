//
//  ZeusConfig.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ZeusConfig {
    
    /**
     *  网络服务相关
     */
    struct HttpService {
        /**
         请求超时时间
         
         - returns: NSTimeInterval
         */
        static let timeoutInterval:NSTimeInterval = 15
    }
    
    /**
     *  发布活动相关
     */
    struct AddNewActivity {
        /**
         最大主席数
         
         - returns:
         */
        static let maxChairManCount:Int = 5
        /**
         最大主题数
         
         - returns:
         */
        static let maxThemeCount:Int = 5
        /**
         最大讲题数
         
         - returns:
         */
        static let maxTopic:Int = 5
        /**
         最大讲者数
         
         - returns:
         */
        static let maxSpeaker:Int = 5
    }
    
    struct CommonUI {
        static let progressViewHeight:CGFloat = 5
    }
    
    /**
     重新获取验证的时间
     
     - returns: Int
     */
    class func resendVerifyCodeSeconds() -> Int {
        return 5
    }
    class func verifyCodeLength()-> Int {
        return 4
    }
    
    
}
