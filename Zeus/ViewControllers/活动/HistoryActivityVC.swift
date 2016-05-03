//
//  HistoryActivityVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class HistoryActivityVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let activityCellId = "ActivityCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: activityCellId, bundle:nil), forCellReuseIdentifier: activityCellId)
        tableView.rowHeight = ActivityCell.heightOfCell()
        tableView.keyboardDismissMode = .OnDrag
    }
}

extension HistoryActivityVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        let activityDetailVC = UIViewController.controllerWith(storyboardName: "ActivityDetailVC", viewControllerId: "ActivityDetailVC")
        navigationController?.pushViewController(activityDetailVC, animated: true)
    }
}

extension HistoryActivityVC : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let activityCell = tableView.dequeueReusableCellWithIdentifier(activityCellId) as! ActivityCell
        return activityCell
    }
    
}