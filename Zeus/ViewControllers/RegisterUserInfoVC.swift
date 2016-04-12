//
//  RegisterUserInfoVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RegisterUserInfoVC: BaseViewController {

    @IBOutlet weak var finishButton: UIBarButtonItem!
    @IBOutlet weak var positionTextField: BorderTextField!
    @IBOutlet weak var companyTextField: BorderTextField!
    @IBOutlet weak var nameTextField: BorderTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishButton.enabled = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        nameTextField.becomeFirstResponder()
    }

    @IBAction func nameTextFieldChanged(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        finishButton.enabled = !text.isEmpty
    }
    
    @IBAction func completeRegister_Touch(sender: AnyObject){
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appdelegate.startMainStory()
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
