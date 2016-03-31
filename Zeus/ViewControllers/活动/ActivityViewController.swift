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
    }
}

extension ActivityViewController:UITableViewDelegate{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

extension ActivityViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let activityCell = tableView.dequeueReusableCellWithIdentifier(activityCellId) as! ActivityCell
        return activityCell
        
    }
    
}