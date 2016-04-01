//
//  AddActivityVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import XLForm

class AddActivityVC: XLFormViewController {
    /**
     *  Form Tags
     */
    private struct Tags {
        static let Name = "name"
        static let Count = "count"
        static let ClinetType = "clientType"
        
        static let StartTime = "startTime"
        static let EndTime = "endTime"
        static let Address = "address"
        static let Theme = "theme"
        static let ChairMan = "chairMan"
        static let Speaker = "Speaker"
        static let Topic = "topic"
        /// 落款
        static let Sign = "sign"
    }
    
    var lastChairManRow:XLFormRowDescriptor!
    var lastTopicRow:XLFormRowDescriptor!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initializeForm()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeForm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        let buttonView = PublishButtonView(frame: self.view.frame)
        buttonView.size = CGSize(width: self.view.width, height: 150)
        buttonView.delegate = self
        self.tableView.tableFooterView = buttonView
    }
    
    // MARK: Init Form
    func initializeForm() {
        
        //注册自定义Cell
        XLFormViewController.cellClassesForRowDescriptorTypes()[XLFormRowDescriptorTypeAddButton] = "AddItemCell"
        
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "新建活动")
        //form.assignFirstResponderOnShow = true
        
        section = XLFormSectionDescriptor()
        //活动名称
        row = XLFormRowDescriptor(tag: Tags.Name, rowType: XLFormRowDescriptorTypeText, title: "活动名称")
        row.required = true
        row.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        row.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        section.addFormRow(row)
        
        //活动人数
        row = XLFormRowDescriptor(tag: Tags.Count, rowType: XLFormRowDescriptorTypeInteger, title: "活动人数")
        row.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        row.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        section.addFormRow(row)
        
        // 客户类型
        row = XLFormRowDescriptor(tag: Tags.ClinetType, rowType: XLFormRowDescriptorTypeSelectorPush, title: "客户类型")
        row.action.viewControllerStoryboardId = "ClientTypeVC"
        row.noValueDisplayText = "请选择"
        section.addFormRow(row)
        
        form.addFormSection(section)
        
        section = XLFormSectionDescriptor()
        //时间
        
        row = XLFormRowDescriptor(tag: Tags.StartTime, rowType:XLFormRowDescriptorTypeDateTime , title: "开始时间")
        row.noValueDisplayText = "请选择"
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.EndTime, rowType:XLFormRowDescriptorTypeDateTime , title: "结束时间")
        row.noValueDisplayText = "请选择"
        section.addFormRow(row)
        
        //地点
        row = XLFormRowDescriptor(tag: Tags.Address, rowType:XLFormRowDescriptorTypeText , title: "活动地点")
        row.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        row.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        section.addFormRow(row)
        
        //主题
        row = XLFormRowDescriptor(tag: Tags.Theme, rowType: XLFormRowDescriptorTypeText, title: "大会主题")
        row.required = true
        row.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        row.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        section.addFormRow(row)
        
        //主席
        row = XLFormRowDescriptor(tag: Tags.ChairMan,rowType: XLFormRowDescriptorTypeSelectorPush,title: "大会主席")
        row.noValueDisplayText = "请选择"
        lastChairManRow = row
        section.addFormRow(row)
        
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: nil, rowType: XLFormRowDescriptorTypeAddButton)
        row.action.formSelector = #selector(self.addChairMan)
        section.addFormRow(row)
        
        form.addFormSection(section)
        
        //讲者
        section = XLFormSectionDescriptor()
        row = XLFormRowDescriptor(tag: Tags.Speaker,rowType: XLFormRowDescriptorTypeSelectorPush,title: "讲者")
        row.noValueDisplayText = "请选择"
        section.addFormRow(row)
        
        //讲题
        row = XLFormRowDescriptor(tag: Tags.Topic, rowType: XLFormRowDescriptorTypeText, title: "讲题")
        row.required = true
        row.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        row.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        section.addFormRow(row)
        lastTopicRow = row
        
        row = XLFormRowDescriptor(tag: nil, rowType: XLFormRowDescriptorTypeAddButton)
        row.action.formSelector = #selector(self.addTopic)
        section.addFormRow(row)
        
        form.addFormSection(section)
        
        //落款
        section = XLFormSectionDescriptor()
        row = XLFormRowDescriptor(tag: Tags.Sign, rowType: XLFormRowDescriptorTypeText, title: "落款")
        row.required = true
        row.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        row.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        section.addFormRow(row)
        form.addFormSection(section)
        
        self.form = form
        
    }
    
    // MARK: Actions
    func publishActivity() {
        
    }
    
    func addTopic(){
        let row = XLFormRowDescriptor(tag: Tags.Speaker,rowType: XLFormRowDescriptorTypeSelectorPush,title: "讲者")
        self.form.addFormRow(row, afterRow: lastTopicRow)
        
        let topicRow = XLFormRowDescriptor(tag: Tags.Topic, rowType: XLFormRowDescriptorTypeText, title: "讲题")
        topicRow.required = true
        topicRow.cellConfigAtConfigure["textField.placeholder"] = "请输入"
        topicRow.cellConfigAtConfigure["textField.textAlignment"] = NSTextAlignment.Right.rawValue
        self.form.addFormRow(topicRow, afterRow: row)
        
        lastTopicRow = topicRow
    }
    
    func addChairMan() {
        let row = XLFormRowDescriptor(tag: Tags.ChairMan,rowType: XLFormRowDescriptorTypeSelectorPush,title: "大会主席")
        
        self.form.addFormRow(row, afterRow: lastChairManRow)
        lastChairManRow = row
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


extension AddActivityVC:PublishButtonViewDelegate{
    // MARK: Publish Action
    func publishButtonViewDidTouchButton() {
        print("publish");
    }
}
