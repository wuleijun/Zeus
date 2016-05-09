//
//  CheckListVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/9.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 名单查看
class CheckListVC: BaseViewController {

    let clientInviteCellId = "ClientInviteCell"
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.registerNib(UINib(nibName: clientInviteCellId, bundle: nil), forCellReuseIdentifier: clientInviteCellId)
            tableView.rowHeight = ClientInviteCell.heightOfCell()
        }
    }
    @IBOutlet weak var progressHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var topView: UIView! {
        didSet{
            topView.backgroundColor = UIColor.zeusNavigationBarTintColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBarShadow()
        progressHeightConstraint.constant = ZeusConfig.CommonUI.progressViewHeight
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0) { 
            self.progressView.progress = 0.5
            self.progressView.layoutIfNeeded()
        }
    }

}

// MARK: TableView DataSource
extension CheckListVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientInviteCell  = tableView.dequeueReusableCellWithIdentifier(clientInviteCellId) as! ClientInviteCell
        return clientInviteCell
    }
    
}
