//
//  AddRelatedUserVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/14.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class AddRelatedUserVC: UITableViewController {

    let relatedUserCellId = "MyRelatedUserCell"
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .Minimal
        searchBar.placeholder = "请输入手机号，搜索用户"

        var textFieldInsideSearchBar = searchBar.valueForKey("searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.whiteColor()
        textFieldInsideSearchBar?.keyboardType = .NumberPad
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchBar
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.resignFirstResponder()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = UIColor.zeusBackgroundColor()
        tableView.registerNib(UINib(nibName: relatedUserCellId, bundle: nil), forCellReuseIdentifier: relatedUserCellId)
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .OnDrag
        tableView.rowHeight = MyRelatedUserCell.heightOfCell()
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

extension AddRelatedUserVC {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCellWithIdentifier(relatedUserCellId) as! MyRelatedUserCell
        userCell.cellType = .hasAddButton
        userCell.delegate = self
        return userCell
    }
    
}

extension AddRelatedUserVC:MyRelatedUserCellDelegate {
    func relatedUserCellDidTouchUser() {
        searchBar.resignFirstResponder()
        
        let actionSheet = UIAlertController(title: nil, message: "您确定要关联吗？", preferredStyle: .ActionSheet)
        let confirmAction = UIAlertAction(title: "关联", style: .Default) {(action:UIAlertAction) in
            print("关联")
        }
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        actionSheet.addAction(confirmAction)
        actionSheet.addAction(cancelAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
}
