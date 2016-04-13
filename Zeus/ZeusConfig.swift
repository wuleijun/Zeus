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
