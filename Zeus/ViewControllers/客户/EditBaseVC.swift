//
//  EditBaseVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/28.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class EditBaseVC: BaseViewController {
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        return tableView
    }()
    
    lazy var textField:BorderTextField = {
        let textField = BorderTextField()
        textField.clearButtonMode = .Always
        textField.backgroundColor = UIColor.whiteColor()
        return textField
    }()
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textField)
        textField.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(10)
            make.height.equalTo(50)
        }
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(textField.snp_bottom).offset(10)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view)
        }
        
        addRightButton()
        // Do any additional setup after loading the view.
    }
    
    func save_Touch() {
        
    }

    private func addRightButton() {
        let button = UIButton(type: .System)
        button.setTitle("保存", forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.addTarget(self, action:#selector(save_Touch) , forControlEvents: .TouchUpInside)
        button.sizeToFit()
        let barItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barItem
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

extension EditBaseVC : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cellId")
        cell.textLabel?.text = "test"
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }
}

extension EditBaseVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
