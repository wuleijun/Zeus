//
//  ActivityDetailVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ActivityDetailVC: BaseViewController {

    private lazy var moreOperationView:MoreOperationsView = {
        let moreOperationView = MoreOperationsView()
        
        //签到
        moreOperationView.createSignAction = { [weak self] in
            
            if let strongSelf = self {
                let signVC = UIViewController.controllerWith(storyboardName: "SignViewController", viewControllerId: "SignViewController") as! SignViewController
                strongSelf.navigationController?.pushViewController(signVC, animated: true)
            }
        }
        
        //名额分配
        moreOperationView.createAllocationAction = { [weak self] in
            if let strongSelf = self {
                let allocationVC = UIViewController.controllerWith(storyboardName: "AllocationViewController", viewControllerId: "AllocationViewController") as! AllocationViewController
                strongSelf.navigationController?.pushViewController(allocationVC, animated: true)
            }
        }
        
        //客户邀请
        moreOperationView.createClientInviteAction = { [weak self] in
            if let strongSelf = self {
                let clientInviteVC = UIViewController.controllerWith(storyboardName: "ClientInviteVC", viewControllerId: "ClientInviteVC") as! ClientInviteVC
                strongSelf.navigationController?.pushViewController(clientInviteVC,animated: true)
            }
        }
        return moreOperationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func more_Touch(sender: AnyObject) {
        if let view = view.window {
            moreOperationView.showInView(view)
        }
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
