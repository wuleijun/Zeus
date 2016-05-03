//
//  ActivityViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ActivityViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
 
    let activityCellId = "ActivityCell"
    
    override func viewDidLoad() {
        tableView.registerNib(UINib.init(nibName: activityCellId, bundle: nil), forCellReuseIdentifier:activityCellId)
        tableView.rowHeight = ActivityCell.heightOfCell()
        tableView.keyboardDismissMode = .OnDrag
    }
}

extension ActivityViewController:UITableViewDelegate{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        let activityDetailVC = UIViewController.controllerWith(storyboardName: "ActivityDetailVC", viewControllerId: "ActivityDetailVC")
        navigationController?.pushViewController(activityDetailVC, animated: true)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            print("\(indexPath.row)");
        }
    }
}

extension ActivityViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let activityCell = tableView.dequeueReusableCellWithIdentifier(activityCellId) as! ActivityCell
        return activityCell
        
    }
}