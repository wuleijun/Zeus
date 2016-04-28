//
//  EditClientVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/21.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/**
 视图类型
 
 - Preview: 预览（不可编辑）
 - Edit:    编辑
 */
enum ControllerType {
    case Preview, Edit
}

class EditClientVC: UITableViewController {

    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    var type:ControllerType = .Preview {
        didSet{
            editButton.hidden = type == .Preview
        }
    }
    var client:Client?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.zeusBackgroundColor()
        // Do any additional setup after loading the view.
        
        if  let client = client {
            type = .Preview
            nameTxtField.text = client.name
        }else{
            type = .Edit
        }
        
        tableView.tableFooterView = {
            let footerView = UIView(frame: self.view.frame)
            footerView.backgroundColor = UIColor.clearColor()
            footerView.height = 30
            return footerView
        }()
    }

    let headerTitles = ["基本信息","单位信息","联系方式","系统信息"]
    
    // MARK: Action
    @IBAction func save_Touch(sender: AnyObject) {
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

extension EditClientVC {
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: 44)
        headerView.headerTitle = headerTitles[section]
        return headerView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    //固定住HeaderView
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let sectionHeaderHeight:CGFloat = 44;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
    
}
