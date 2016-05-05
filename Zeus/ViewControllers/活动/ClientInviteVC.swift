//
//  ClientInviteVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/5.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ClientInviteVC: BaseViewController {

    let clientInviteCellID = "ClientInviteCell"
    
    @IBOutlet weak var topView: UIView!{
        didSet{
            topView.backgroundColor = UIColor.zeusNavigationBarTintColor()
        }
    }
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.registerNib(UINib(nibName: clientInviteCellID, bundle: nil), forCellReuseIdentifier: clientInviteCellID)
            tableView.rowHeight = ClientInviteCell.heightOfCell()
        }
    }

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBarShadow()
        progressViewHeightConstraint.constant = ZeusConfig.CommonUI.progressViewHeight
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0) { 
            self.progressView.progress = 0.5
            self.progressView.layoutIfNeeded()
        }
    }
    
    @IBAction func addClient_Touch(sender: AnyObject) {
        let chooseClientVC = UIViewController.controllerWith(storyboardName: "ChooseClientVC", viewControllerId: "ChooseClientVC") as! ChooseClientVC
        navigationController?.pushViewController(chooseClientVC, animated: true)
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
extension ClientInviteVC : UITableViewDataSource {

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientInviteCell = tableView.dequeueReusableCellWithIdentifier(clientInviteCellID) as! ClientInviteCell
        return clientInviteCell
    }
    
}

// MARK: TableView Delegate
extension ClientInviteVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
        }
    }
    
}
