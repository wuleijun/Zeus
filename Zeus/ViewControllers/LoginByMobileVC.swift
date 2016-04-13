//
//  LoginByMobileVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class LoginByMobileVC: BaseViewController {
    
    @IBOutlet private weak var mobileTextField: BorderTextField!
    @IBOutlet private weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        mobileTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    @IBAction func textFieldChanged(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        nextButton.enabled = !text.isEmpty
    }
    
    @IBAction func next_Touch(sender: AnyObject) {
        //TODO:获取验证码
        self.performSegueWithIdentifier("showLoginVerifyMobileVC", sender: ["mobile":mobileTextField.text!])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showLoginVerifyMobileVC" {
            if let info = sender as? [String:String]{
                let showLoginVerifyMobileVC = segue.destinationViewController as! LoginVerifyMobileVC
                showLoginVerifyMobileVC.mobile = info["mobile"]
            }
        }
    }
 

}
