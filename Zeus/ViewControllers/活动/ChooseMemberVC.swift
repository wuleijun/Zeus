//
//  ChooseMemberVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/5.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ChooseMemberVC: BaseViewController {
    
    
    let chooseRelatedUserCellId = "ChooseRelatedUserCell"
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.rowHeight = ChooseRelatedUserCell.heightOfCell()
            tableView.registerNib(UINib(nibName: chooseRelatedUserCellId, bundle: nil), forCellReuseIdentifier: chooseRelatedUserCellId)
        }
    }
    
    var selectedUser:[NSIndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "选择用户"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func confirm_Touch(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
extension ChooseMemberVC : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let chooseCell = tableView.dequeueReusableCellWithIdentifier(chooseRelatedUserCellId) as! ChooseRelatedUserCell
        
        chooseCell.selectedImageView.highlighted = selectedUser.contains(indexPath)
        
        return chooseCell
    }
    
}

// MARK: TableView Delegate
extension ChooseMemberVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
        }
        if selectedUser.contains(indexPath) {
            if let index = selectedUser.indexOf(indexPath) {
                selectedUser.removeAtIndex(index)
            }
        }else {
            selectedUser.insert(indexPath, atIndex: 0)
        }
        tableView.reloadData()
    }
}
