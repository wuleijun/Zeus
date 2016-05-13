//
//  ClientTypeVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import XLForm

class Test:NSObject,XLFormOptionObject {
    var name = "name"
    init(name:String){
        self.name = name
    }
    func formDisplayText() -> String {
        return "test"
    }
    
    func formValue() -> AnyObject {
        return self
    }
}
class ClientTypeVC: BaseViewController,XLFormRowDescriptorViewController {

    let clientTypeExpandCellId = "ClientTypeExpandCell"
    let clientTypeCellId = "ClientTypeCell"
    let clientTypeAddCellId = "ClientTypeAddCell"
    
    @IBOutlet weak var tableView: RJExpandableTableView!{
        didSet{
            tableView.registerNib(UINib(nibName: clientTypeExpandCellId, bundle: nil), forCellReuseIdentifier: clientTypeExpandCellId)
            tableView.registerNib(UINib(nibName: clientTypeCellId, bundle: nil), forCellReuseIdentifier: clientTypeCellId)
            tableView.registerNib(UINib(nibName: clientTypeAddCellId, bundle: nil), forCellReuseIdentifier: clientTypeAddCellId)
            tableView.tableFooterView = UIView()
        }
    }
    
    var rowDescriptor: XLFormRowDescriptor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rowDescriptor?.value = Test(name: "test")
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

// MARK: TableView DataSource
extension ClientTypeVC : RJExpandableTableViewDataSource {
    
    func tableView(tableView: RJExpandableTableView, needsToDownloadDataForExpandSection section: Int) -> Bool {
        return false
    }
    
    func tableView(tableView: RJExpandableTableView, expandingCellForSection section: Int) -> RJExpandingTableViewCell {
        let expandCell = tableView.dequeueReusableCellWithIdentifier(clientTypeExpandCellId) as! ClientTypeExpandCell
        return expandCell
    }
    
    func tableView(tableView: RJExpandableTableView, canExpandInSection section: Int) -> Bool {
        return true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let  addCell = tableView.dequeueReusableCellWithIdentifier(clientTypeAddCellId) as! ClientTypeAddCell
            return addCell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(clientTypeCellId) as! ClientTypeCell
        return cell
    }
}

extension ClientTypeVC: RJExpandableTableViewDelegate {
    func tableView(tableView: RJExpandableTableView, downloadDataForExpandableSection section: Int) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return ClientTypeExpandCell.heightOfCell()
        }
        return 44
    }
}
