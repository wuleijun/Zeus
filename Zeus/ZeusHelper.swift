//
//  ZeusHelper.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/13.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit



func delay(time: NSTimeInterval, work: dispatch_block_t) {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
        work()
    }
}
