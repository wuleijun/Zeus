//
//  AllocationViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/4.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 分配名额
class AllocationViewController: BaseViewController {
    
    let allocationCellId = "AllocationCell"
    
    @IBOutlet var footerView: UIView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.registerNib(UINib(nibName: allocationCellId, bundle: nil), forCellReuseIdentifier: allocationCellId)
            tableView.rowHeight = AllocationCell.heightOfCell()
        }
    }
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var topView: UIView! {
        didSet{
            topView.backgroundColor = UIColor.zeusNavigationBarTintColor()
        }
    }
    @IBOutlet weak var progressHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBarShadow()
        progressHeightConstraint.constant = 5
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0) { 
            self.progressView.progress = 0.5
            self.progressView.layoutIfNeeded()
        }
    }
    
    // MARK: Actions
    @IBAction func addMember_Touch(sender: AnyObject) {
        let chooseMemberVC = UIViewController.controllerWith(storyboardName: "ChooseMemberVC", viewControllerId: "ChooseMemberVC") as! ChooseMemberVC
        navigationController?.pushViewController(chooseMemberVC, animated: true)
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

// MARK: TableView DataSource
extension AllocationViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let allocationCell = tableView.dequeueReusableCellWithIdentifier(allocationCellId) as! AllocationCell
        return allocationCell
    }
    
}

// MARK: TableView Delegate
extension AllocationViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return footerView.height
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
}
