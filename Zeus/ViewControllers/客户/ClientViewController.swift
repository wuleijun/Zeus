//
//  ClientViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/29.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import RealmSwift

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
    
    var clientSections:ClientSection?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: clientTableCellId, bundle: nil), forCellReuseIdentifier: clientTableCellId)
        
        clientSections = clientsWithInitLetter()
    }
}

extension ClientViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let clientSections = clientSections {
            return clientSections.sectionCount()
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let clientSections = clientSections {
            return clientSections.numberOfRowsInSection(section)
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientCell = tableView.dequeueReusableCellWithIdentifier(clientTableCellId) as! ClientTableCell
        if let clientSections = clientSections {
            let client = clientSections.clientForIndexPath(indexPath)
            clientCell.client = client
        }
        return clientCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let clientSections = clientSections {
            return clientSections.titleForHeaderSection(section)
        }
        return ""
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        if let clientSections = clientSections {
            return clientSections.sectionTitles
        }
        return [""]
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