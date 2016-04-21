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
    
    lazy private var userCountFooterView = UserCountLabel(title: "20位关联成员")
    
    let relatedEachotherCellId = "RelateEachOtherCell"
    let myRelatedUserCellId = "MyRelatedUserCell"
    
    let sectionTitles = ["A","B","C","D","E","F","G","H"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: relatedEachotherCellId, bundle: nil), forCellReuseIdentifier: relatedEachotherCellId)
        tableView.registerNib(UINib(nibName: myRelatedUserCellId, bundle: nil), forCellReuseIdentifier: myRelatedUserCellId)
        // Do any additional setup after loading the view.
        tableView.tableFooterView = userCountFooterView
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
        return sectionTitles
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count + 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Section.EachOther.rawValue {
            return 1
        }
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if indexPath.section == Section.EachOther.rawValue {
            let firstCell = tableView.dequeueReusableCellWithIdentifier(relatedEachotherCellId) as! RelateEachOtherCell
            return firstCell
        }
        let relatedUserCell = tableView.dequeueReusableCellWithIdentifier(myRelatedUserCellId) as! MyRelatedUserCell
        if indexPath.row%2 == 0 {
            relatedUserCell.cellType = RelatedUserCellType.RelatedEachOther
        }else{
            relatedUserCell.cellType = RelatedUserCellType.Nomal
        }
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
        let heightOfRelateEachOtherCell:CGFloat = 50
        if indexPath.section == 0 {
            return heightOfRelateEachOtherCell
        }
        return MyRelatedUserCell.heightOfCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }

            switch indexPath.section {
            case Section.EachOther.rawValue:
                self.performSegueWithIdentifier("showRelateEachOtherVC", sender: nil)
            default:
                break
            }
        
    }
}

