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

    var isSearch = false
    
    
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.searchFieldBackgroundPositionAdjustment = UIOffset(horizontal: 10, vertical: 0)
            searchBar.delegate = self
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
    
    var clientSections = ClientSection()
    var searchClients:Results<Client>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: clientTableCellId, bundle: nil), forCellReuseIdentifier: clientTableCellId)
        
        clientSections = clientsWithInitLetter()
    }
    
    // MARK: Actions
    @IBAction func addClient_Touch(sender: AnyObject) {
        performSegueWithIdentifier("showEditClientVC", sender:nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showEditClientVC" {
            if let client = sender as? Client {
                let vc = segue.destinationViewController as! EditClientVC
                vc.client = client
            }
        }
    }
}

// MARK: TableView DataSource
extension ClientViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if isSearch {
            return 1
        }
        return clientSections.sectionCount()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return searchClients.count
        }
        return clientSections.numberOfRowsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientCell = tableView.dequeueReusableCellWithIdentifier(clientTableCellId) as! ClientTableCell
        var client:Client?
        if isSearch {
            client = searchClients[indexPath.row]
        }else{
            client = clientSections.clientForIndexPath(indexPath)
        }
        clientCell.client = client
        return clientCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearch {
            return ""
        }
        return clientSections.titleForHeaderSection(section)
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        if isSearch {
            return [""]
        }
        return clientSections.sectionTitles
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index
    }
}

// MARK: TableView Delegate
extension ClientViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        var client:Client?
        if isSearch {
            client = searchClients[indexPath.row]
        }else{
            client = clientSections.clientForIndexPath(indexPath)
        }
        performSegueWithIdentifier("showEditClientVC", sender:client)
    }
    
}

// MARK: SearchBar Delegate
extension ClientViewController : UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        defer {
            tableView.reloadData()
        }
        guard searchText.characters.count > 0 else {
            isSearch = false
            return
        }
        isSearch = true
        searchClients = clientsWith(searchText: searchText)
    }
}