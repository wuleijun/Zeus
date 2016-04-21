//
//  AppDelegate.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setupAppearance()
        startLoginStory()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    // MARK: Helpers
    func startLoginStory() {
        let loginNavigationController = UIViewController.controllerWith(storyboardName: "LoginAndRegister", viewControllerId: "loginNavigationController") as! UINavigationController
        window?.rootViewController = loginNavigationController
    }
    func startMainStory() {
        let mainTabBarController = UIViewController.controllerWith(storyboardName: "Main", viewControllerId: "mainTabBarController") as! UITabBarController
        window?.rootViewController = mainTabBarController
    }
    
    // MARK: Private
    private func setupAppearance(){
    
        
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zeusNavigationBarTintColor()], forState: .Normal)
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zeusNavigationBarTintColor().colorWithAlphaComponent(0.3)], forState: .Disabled)
        
        // NavigationBar Title Style
        
        let shadow: NSShadow = {
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.lightGrayColor()
            shadow.shadowOffset = CGSizeMake(0, 0)
            return shadow
        }()
        
        let textAttributes = [
            NSForegroundColorAttributeName: UIColor.zeusNavigationBarTitleColor(),
            NSShadowAttributeName: shadow,
            NSFontAttributeName: UIFont.zeusNavigationBarTitleFont()
        ]
        
        /*
         let barButtonTextAttributes = [
         NSForegroundColorAttributeName: UIColor.yepTintColor(),
         NSFontAttributeName: UIFont.barButtonFont()
         ]
         */
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().barTintColor = UIColor.zeusNavigationBarTintColor()
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.zeusNavigationBarTitleColor()
        
        //UIBarButtonItem.appearance().setTitleTextAttributes(barButtonTextAttributes, forState: UIControlState.Normal)
        //UINavigationBar.appearance().setBackgroundImage(UIImage(named:"white"), forBarMetrics: .Default)
        
        UINavigationBar.appearance().translucent = false
        
        // TabBar
        
        //UITabBar.appearance().backgroundImage = UIImage(named:"white")
        //UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().tintColor = UIColor.zeusTabBarTintColor()
        UITabBar.appearance().barTintColor = UIColor.whiteColor()
        //UITabBar.appearance().translucent = false
        
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
    }
}

