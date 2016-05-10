//
//  ActivityDetailVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class ActivityDetailVC: BaseViewController {
    
    let headerHeight:CGFloat = 44
    let headerTitles = ["大会信息","大会主席","大会内容","其他"]
    
    let activityInfoCellId = "ActivityInfoCell"
    let activityDetailCellId = "ActivityDetailCell"
    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.registerNib(UINib(nibName: activityInfoCellId, bundle: nil), forCellReuseIdentifier: activityInfoCellId)
            tableView.registerNib(UINib(nibName: activityDetailCellId, bundle: nil), forCellReuseIdentifier: activityDetailCellId)
        }
    }
    private lazy var moreOperationView:MoreOperationsView = {
        let moreOperationView = MoreOperationsView()
        
        //授权签到
        moreOperationView.createAuthSignAction = { [weak self] in
            
            if let strongSelf = self{
                let authSignVC = UIViewController.controllerWith(storyboardName: "AuthSignUserVC", viewControllerId: "AuthSignUserVC") as! AuthSignUserVC
                strongSelf.navigationController?.pushViewController(authSignVC, animated:true)
            }
        }
        
        //名单查看
        moreOperationView.createMemeberCheckAction = { [weak self] in
            if let strongSelf = self {
                let checkListVC = UIViewController.controllerWith(storyboardName: "CheckListVC", viewControllerId: "CheckListVC") as! CheckListVC
                strongSelf.navigationController?.pushViewController(checkListVC, animated: true)
            }
        }
        
        //签到
        moreOperationView.createSignAction = { [weak self] in
            
            if let strongSelf = self {
                let signVC = UIViewController.controllerWith(storyboardName: "SignViewController", viewControllerId: "SignViewController") as! SignViewController
                strongSelf.navigationController?.pushViewController(signVC, animated: true)
            }
        }
        
        
        //名额分配
        moreOperationView.createAllocationAction = { [weak self] in
            if let strongSelf = self {
                let allocationVC = UIViewController.controllerWith(storyboardName: "AllocationViewController", viewControllerId: "AllocationViewController") as! AllocationViewController
                strongSelf.navigationController?.pushViewController(allocationVC, animated: true)
            }
        }
        
        //客户邀请
        moreOperationView.createClientInviteAction = { [weak self] in
            if let strongSelf = self {
                let clientInviteVC = UIViewController.controllerWith(storyboardName: "ClientInviteVC", viewControllerId: "ClientInviteVC") as! ClientInviteVC
                strongSelf.navigationController?.pushViewController(clientInviteVC,animated: true)
            }
        }
        return moreOperationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func more_Touch(sender: AnyObject) {
        if let view = view.window {
            moreOperationView.showInView(view)
        }
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


enum SectionInfo:Int {
    case Info = 0
    case ChairMan
    case Topic
    case Badging
    
    var heightOfCell:CGFloat {
        switch self {
        case .Info:
            return ActivityInfoCell.heightOfCell()
        default:
            return ActivityDetailCell.heightOfCell()
        }
    }
    
}

// MARK: TableView DataSource
extension ActivityDetailVC : UITableViewDataSource {
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case SectionInfo.ChairMan.rawValue,SectionInfo.Topic.rawValue:
            return 2
        default:
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let activityCell = tableView.dequeueReusableCellWithIdentifier(activityDetailCellId) as! ActivityDetailCell
        switch indexPath.section {
            
        case SectionInfo.Info.rawValue:
            let activityInfoCell = tableView.dequeueReusableCellWithIdentifier(activityInfoCellId) as! ActivityInfoCell
            return activityInfoCell
        case SectionInfo.ChairMan.rawValue:
            return activityCell
        case SectionInfo.Topic.rawValue:
            return activityCell
        case SectionInfo.Badging.rawValue:
            return activityCell
        default:
            return activityCell
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: headerHeight)
        headerView.headerTitle = headerTitles[section]
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
}

// MARK: TableView Delegate
extension ActivityDetailVC : UITableViewDelegate {

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard let sectionInfo = SectionInfo(rawValue: indexPath.section) else{
            return 44
        }
        return sectionInfo.heightOfCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
}

extension ActivityDetailVC: UIScrollViewDelegate {
    //固定住HeaderView
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if (scrollView.contentOffset.y<=headerHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=headerHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-headerHeight, 0, 0, 0);
        }
    }
}
