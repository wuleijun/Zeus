//
//  UIViewController+Zeus.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/7.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import Proposer

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
    
    var tabBarHeight: CGFloat {
        return 50
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

extension UIViewController {
    
    func showImagePickerController(delegate delegate:protocol<UIImagePickerControllerDelegate, UINavigationControllerDelegate>?) ->Void  {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.allowsEditing = true
        imagePickerVC.delegate = delegate
        imagePickerVC.sourceType = .PhotoLibrary
        
        let alertViewController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertViewController.addAction(UIAlertAction(title: "拍照", style: .Default, handler: { (action:UIAlertAction) in
            
            proposeToAccess(.Camera, agreed: {
                guard UIImagePickerController.isSourceTypeAvailable(.Camera) else {
                    self.alertCanNotOpenCamera()
                    return
                }
                imagePickerVC.sourceType = .Camera
                self.presentViewController(imagePickerVC, animated: true, completion: nil)
                }, rejected: {
                    self.alertCanNotOpenCamera()
            })
        }))
        alertViewController.addAction(UIAlertAction(title: "从手机相册选择", style: .Default, handler: { [weak self](action:UIAlertAction) in
            
            proposeToAccess(.Photos, agreed: {
                
                guard UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) else {
                    self?.alertCanNotAccessCameraRoll()
                    return
                }
                self?.presentViewController(imagePickerVC, animated: true, completion: nil)
                }, rejected: {
                    self?.alertCanNotAccessCameraRoll()
            })
            
            
            }))
        alertViewController.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: nil))
        
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
}
