//
//  EditBaseVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/28.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class EditBaseVC: BaseViewController {
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.keyboardDismissMode = .OnDrag
        return tableView
    }()
    
    private lazy var tableViewHeaderView:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(14)
        label.text = "    历史使用"
       return label
    }()
    
    private var value:String?
    
    lazy var textField:BorderTextField = {
        let textField = BorderTextField()
        textField.clearButtonMode = .Always
        textField.backgroundColor = UIColor.whiteColor()
        textField.leftTextInset = 15
        textField.text = self.value
        return textField
    }()
    
    convenience init(title:String,value:String?){
        self.init()
        self.value = value
        self.title = title
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textFieldDidChanged), name: UITextFieldTextDidChangeNotification, object: nil)
        
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
        
        tableViewHeaderView.height = 30
        tableView.tableHeaderView = tableViewHeaderView
        
        addRightButton()
        // Do any additional setup after loading the view.
    }
    
    func save_Touch() {
        
    }

    func textFieldDidChanged() {
        if textField.text?.characters.count > 0 {
            tableView.tableHeaderView = nil
        }else{
            tableView.tableHeaderView = tableViewHeaderView
        }
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
    
    //为了让线从x=0开始
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }
}

extension EditBaseVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
}
