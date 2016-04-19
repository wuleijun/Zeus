//
//  EditInfoViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/7.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit


enum EditInfoType {
    case Name, Company, Position
}

struct EditInfo {

    var infoType = EditInfoType.Name
    var value:String?
    
    init(infoType:EditInfoType,value:String){
        self.infoType = infoType
        self.value = value
    }
}

protocol EditInfoViewControllerDelegate: class {
    func editInfoViewControllerDidSaveEditInfo(editInfo:EditInfo)
}

class EditInfoViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var editInfo:EditInfo?
    weak var delegate:EditInfoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        
        guard let info = self.editInfo else{
            assert(false, "必须设置editInfo")
            return
        }
        
        switch info.infoType {
        case EditInfoType.Name:
            self.titleLabel.text = "姓名"
        case EditInfoType.Company:
            self.titleLabel.text = "公司"
        case EditInfoType.Position:
            self.titleLabel.text = "职位"
        }
        title = titleLabel.text
        textField.text = info.value
        
        textField.becomeFirstResponder()
    }

    @IBAction func save_Touch(sender: AnyObject) {
        //TODO:网络请求
        editInfo?.value = textField.text
        if let delegate = delegate {
            delegate.editInfoViewControllerDidSaveEditInfo(self.editInfo!)
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
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
