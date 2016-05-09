//
//  AuthSignUserVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/9.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 授权签到VC
class AuthSignUserVC: BaseViewController {

    
    let relatedUserCellId = "MyRelatedUserCell"
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.registerNib(UINib(nibName: relatedUserCellId, bundle: nil), forCellReuseIdentifier: relatedUserCellId)
            tableView.rowHeight = MyRelatedUserCell.heightOfCell()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBAction func addSignUser_Touch(sender: AnyObject) {
        let chooseUserVC = UIViewController.controllerWith(storyboardName: "ChooseMemberVC", viewControllerId: "ChooseMemberVC") as! ChooseMemberVC
        navigationController?.pushViewController(chooseUserVC, animated: true)
    }
}

// MARK: TableView DataSource
extension AuthSignUserVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let signUserCell = tableView.dequeueReusableCellWithIdentifier(relatedUserCellId) as! MyRelatedUserCell
        signUserCell.cellType = RelatedUserCellType.Nomal
        return signUserCell
    }
 
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            ZeusAlert.alertConfirmOrCancel(title: "提示", message: "确定要取消该用户的签到权限吗？", confirmTitle: "确定", cancelTitle: "取消", inViewController: self, withConfirmAction: {
                    print("deleted")
                }, cancelAction: {})
        }
    }
}

// MARK: TableView Delegate
extension AuthSignUserVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
}

