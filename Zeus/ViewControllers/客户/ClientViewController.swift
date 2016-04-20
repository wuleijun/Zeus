//
//  ClientViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ClientViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.searchFieldBackgroundPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
        }
    }
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.backgroundColor = UIColor.clearColor()
            tableView.tableFooterView = UIView()
            tableView.keyboardDismissMode = .OnDrag
            tableView.rowHeight = ClientTableCell.heightOfCell()
            tableView.sectionIndexBackgroundColor = UIColor.clearColor()
        }
    }
    
    let clientTableCellId = "ClientTableCell"
    let sectionTitles = ["A","B","C","D","E","F","G"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: clientTableCellId, bundle: nil), forCellReuseIdentifier: clientTableCellId)
    }
}

extension ClientViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientCell = tableView.dequeueReusableCellWithIdentifier(clientTableCellId) as! ClientTableCell
        return clientCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index
    }
}

extension ClientViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
}