//
//  MyRelatedUserVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/14.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class MyRelatedUserVC: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!{
        didSet{
            tableView.sectionIndexBackgroundColor = UIColor.clearColor()
        }
    }
    
    lazy var searchController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self;
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchBar.searchBarStyle = .Minimal
        searchController.searchBar.backgroundColor = UIColor.whiteColor()
        searchController.searchBar.barTintColor = UIColor.whiteColor()
        
        searchController.searchBar.placeholder = NSLocalizedString("搜索我的关联", comment: "")
        searchController.searchBar.sizeToFit()
        
        searchController.searchBar.delegate = self
        return searchController
    }()
    private var searchControllerIsActive: Bool {
        return searchController.active ?? false
    }
    
    let relatedEachotherCellId = "RelateEachOtherCell"
    let myRelatedUserCellId = "MyRelatedUserCell"
    
    let sectionTitles = ["A","B","C","D","E","F","G","H"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        tableView.registerNib(UINib(nibName: relatedEachotherCellId, bundle: nil), forCellReuseIdentifier: relatedEachotherCellId)
        tableView.registerNib(UINib(nibName: myRelatedUserCellId, bundle: nil), forCellReuseIdentifier: myRelatedUserCellId)
        // Do any additional setup after loading the view.
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //设置UISearchBar取消按钮颜色
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zeusNavigationBarTintColor()], forState: .Normal)
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zeusTintColor()], forState: .Normal)
    }
    
    // MARK: Actions
    @IBAction func addRelatedUser_Touch(sender: AnyObject) {
        self.performSegueWithIdentifier("showAddRelatedUserVC", sender: nil)
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

extension MyRelatedUserVC : UITableViewDataSource {
    
    private enum Section:Int {
        /**
         互相关联
         */
        case EachOther = 0
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return searchControllerIsActive ? nil:sectionTitles
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if searchControllerIsActive {
            return 1
        }
        return sectionTitles.count + 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchControllerIsActive {
            return 10
        }
        if section == Section.EachOther.rawValue {
            return 1
        }
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.section == Section.EachOther.rawValue && !searchControllerIsActive {
            let firstCell = tableView.dequeueReusableCellWithIdentifier(relatedEachotherCellId) as! RelateEachOtherCell
            return firstCell
        }
        let relatedUserCell = tableView.dequeueReusableCellWithIdentifier(myRelatedUserCellId) as! MyRelatedUserCell
        relatedUserCell.relatedEachOtherFlag.hidden = indexPath.row%2==0
        return relatedUserCell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section > 0 else {
            return nil
        }
        return sectionTitles[section-1]
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index + 1
    }
}

extension MyRelatedUserVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        if indexPath.section == 0 && !searchController.active {
            return 50
        }
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        if searchControllerIsActive {
            
        }else{
            switch indexPath.section {
            case Section.EachOther.rawValue:
                self.performSegueWithIdentifier("showRelateEachOtherVC", sender: nil)
            default:
                break
            }
        }
    }
}

// MARK: - UISearchResultsUpdating

extension MyRelatedUserVC: UISearchResultsUpdating {
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text else {
            return
        }
        tableView.reloadData()
    }
}

// MARK: - UISearchBarDelegate

extension MyRelatedUserVC: UISearchBarDelegate {
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        updateSearchResultsForSearchController(searchController)
        
    }
}

extension MyRelatedUserVC: UISearchControllerDelegate {
    
    func didPresentSearchController(searchController: UISearchController) {
        
    }
    
    func willDismissSearchController(searchController: UISearchController) {
        
    }
}

