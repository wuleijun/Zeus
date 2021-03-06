//
//  EditClientVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/21.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import Proposer

/**
 视图类型
 
 - Preview: 预览（不可编辑）
 - Edit:    编辑
 */
enum ControllerType {
    case Preview, Edit, ClientInviteStatus
}

class EditClientVC: UITableViewController {

    let sectionHeaderHeight:CGFloat = 44
    
    @IBOutlet var clientInviteStatusView: UIView! {
        didSet{
            clientInviteStatusView.backgroundColor = UIColor.zeusNavigationBarTintColor()
        }
    }
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var avatarButton: UIButton!
    
    @IBOutlet weak var nameTxtField: UITextField!
    
    var type:ControllerType = .Preview {
        didSet{
            editButton.hidden = type != .Edit
            if type == .ClientInviteStatus {
                tableView.tableHeaderView = clientInviteStatusView
            }else{
                tableView.tableHeaderView = nil
            }
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
    /**
     头像
    */
    @IBAction func avatar_Touch(sender: AnyObject) {
        
        showImagePickerController(delegate:self)
    }
    
    @IBAction func hospital_Touch(sender: UIButton) {
        
        let editHospitalVC = EditHospitalVC(value: "浙江省邵逸夫医院") { (value) in
            sender.setTitle(value, forState: .Normal)
        }
        navigationController?.pushViewController(editHospitalVC, animated: true)
    }
    
    /**
     职称
     */
    @IBAction func title_Touch(sender: UIButton) {
        let editTitleVC = EditTitleVC(value: "职称例子啊"){ (value:String?) in
            sender.setTitle(value, forState: .Normal)
        }
        navigationController?.pushViewController(editTitleVC, animated: true)
    }
    
    /**
     性别
     */
    @IBAction func gender_Touch(sender: UIButton)
    {
        let genders = ["男","女"]
        ZeusActionSheet.showActionSheet(title: "请选择性别", message: nil, titles: genders, dismissTitle: "取消", inViewController: self) { (index) in
            
            if let index = index {
                sender.setTitle(genders[index], forState: .Normal)
            }
            
        };
    }
    
    /**
     科室
     */
    @IBAction func section_Touch(sender: UIButton){
        let editSectionVC = EditSectionVC(value: "骨科"){ (value:String?) in
            sender.setTitle(value, forState: .Normal)
        }
        navigationController?.pushViewController(editSectionVC, animated: true)
    }
    
    /**
     职务
     */
    @IBAction func position_Touch(sender: UIButton) {
        let editPositionVC = EditPositionVC(value: "职务例子"){ (value:String?) in
            sender.setTitle(value, forState: .Normal)
        }
        navigationController?.pushViewController(editPositionVC, animated: true)
    }
    
    /**
     客户类型
     */
    @IBAction func clientType_Touch(sender: AnyObject) {
        let clientTypeVC = UIViewController.controllerWith(storyboardName: "ClientTypeVC", viewControllerId: "ClientTypeVC") as! ClientTypeVC
        navigationController?.pushViewController(clientTypeVC, animated: true)
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
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: sectionHeaderHeight)
        headerView.headerTitle = headerTitles[section]
        return headerView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    //固定住HeaderView
    override func scrollViewDidScroll(scrollView: UIScrollView) {

        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
    
}

extension EditClientVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        let clipedImage = image.imageByRoundCornerRadius(image.size.width/2)
        avatarButton.setBackgroundImage(clipedImage, forState: .Normal)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
