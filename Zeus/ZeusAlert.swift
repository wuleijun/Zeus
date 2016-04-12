//
//  ZeusAlert.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/11.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ZeusAlert {
    class func alert(title title: String, message: String?, dismissTitle: String, inViewController viewController: UIViewController?, withDismissAction dismissAction: (() -> Void)?) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let action: UIAlertAction = UIAlertAction(title: dismissTitle, style: .Default) { action -> Void in
                if let dismissAction = dismissAction {
                    dismissAction()
                }
            }
            alertController.addAction(action)
            
            viewController?.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    class func alertConfirmOrCancel(title title: String, message: String, confirmTitle: String, cancelTitle: String, inViewController viewController: UIViewController?, withConfirmAction confirmAction: () -> Void, cancelAction: () -> Void) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .Cancel) { action -> Void in
                cancelAction()
            }
            alertController.addAction(cancelAction)
            
            let confirmAction: UIAlertAction = UIAlertAction(title: confirmTitle, style: .Default) { action -> Void in
                confirmAction()
            }
            alertController.addAction(confirmAction)
            
            viewController?.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    func alertCanNotAccessCameraRoll() {
        
        dispatch_async(dispatch_get_main_queue()) {
            ZeusAlert.alertConfirmOrCancel(title: "抱歉", message:"EMM不能访问您的相册！\n但您可以在iOS设置里修改设定。", confirmTitle: "现在就改", cancelTitle: "取消", inViewController: self, withConfirmAction: {
                
                UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
                
                }, cancelAction: {
            })
        }
    }
    
    func alertCanNotOpenCamera() {
        
        dispatch_async(dispatch_get_main_queue()) {
            ZeusAlert.alertConfirmOrCancel(title: "抱歉", message:"EMM不能打开您的相机！\n但您可以在iOS设置里修改设定。", confirmTitle: "现在就改", cancelTitle: "取消", inViewController: self, withConfirmAction: {
                
                UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
                
                }, cancelAction: {
            })
        }
    }
}
