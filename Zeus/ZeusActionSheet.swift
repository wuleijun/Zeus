//
//  ZeusActionSheet.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/28.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ZeusActionSheet {
    
    class func showActionSheet(title title: String, message: String?,titles:[String], dismissTitle: String, inViewController viewController: UIViewController?,actionBlock:((index:Int?) -> Void)?) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            for title in titles {
                let action:UIAlertAction = UIAlertAction(title: title, style: .Default, handler: { (action:UIAlertAction) in
                    let index = titles.indexOf(title)
                    if let actionBlock = actionBlock {
                        actionBlock(index: index)
                    }
                })
                alertController.addAction(action)
            }
            
            let action: UIAlertAction = UIAlertAction(title: dismissTitle, style: .Cancel) { action -> Void in
                
            }
            alertController.addAction(action)
            
            viewController?.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}

