//
//  VerifyMobileVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class VerifyMobileVC: BaseViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var codeTextField: BorderTextField!
    var mobile:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileLabel.text = mobile
        nextButton.enabled = false
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        codeTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    @IBAction func next_Touch(sender: AnyObject) {
        self.performSegueWithIdentifier("showRegisterUserInfoVC", sender: nil)
    }
    
    @IBAction func textFieldDidChanged(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        nextButton.enabled = !text.isEmpty
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
