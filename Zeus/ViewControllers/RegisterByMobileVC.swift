//
//  RegisterByMobileVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class RegisterByMobileVC: BaseViewController {

    @IBOutlet private weak var nextButton: UIButton!{
        didSet{
            nextButton.enabled = false
        }
    }
    @IBOutlet private weak var mobileTextField: BorderTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        mobileTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    @IBAction func textFieldDidChanged(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        nextButton.enabled = !text.isEmpty
    }
    
    @IBAction func next_Touch(sender: AnyObject) {
        self.performSegueWithIdentifier("showVerifyMobileVC", sender: ["mobile":mobileTextField.text!])
    }
    
    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showVerifyMobileVC" {
            
            if let info = sender as? [String: String] {
                let vc = segue.destinationViewController as! VerifyMobileVC
                vc.mobile = info["mobile"]
            }
        }
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension RegisterByMobileVC: UITextFieldDelegate {
    
}