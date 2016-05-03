//
//  ActivityDetailVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ActivityDetailVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func more_Touch(sender: AnyObject) {
        let moreOperationView = MoreOperationsView()
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
