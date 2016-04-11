//
//  SettingsViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/11.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var footerView: UIView!
    
    lazy var versionLabel:UILabel = {
        let versionLabel = UILabel()
        versionLabel.font = UIFont.systemFontOfSize(12)
        versionLabel.textColor = UIColor.lightGrayColor()
        versionLabel.text = UIApplication.sharedApplication().appVersion
        return versionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.zeusBackgroundColor()
        tableView.tableFooterView = footerView
        
        tableView.addSubview(versionLabel)
        versionLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(tableView)
            make.height.equalTo(30)
            make.top.equalTo(tableView.snp_bottom).offset(view.height-topBarsHeight-tabBarHeight)
        }
    }
    
    @IBAction func logout_Touch(sender: AnyObject){
        ZeusAlert.alertConfirmOrCancel(title: "提示", message: "确定要退出登录么？", confirmTitle: "退出登录", cancelTitle: "取消", inViewController: self, withConfirmAction: {
            
            if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                appDelegate.startLoginStory()
            }
            
            }, cancelAction: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension SettingsViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("分享")
        case 1:
            print("意见反馈")
        case 2:
            print("给EMM好评")
        case 3:
            print("关于EMM")
        default:
            break;
        }
    }
}
