//
//  LoginVerifyMobileVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/13.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class LoginVerifyMobileVC: BaseViewController {

    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var resendButton: UIButton!
    @IBOutlet private weak var codeTextField: BorderTextField!
    @IBOutlet private weak var mobileLabel: UILabel!
    
    var second = ZeusConfig.resendVerifyCodeSeconds()
    var haveAppropriateInput = false {
        willSet{
            nextButton.enabled = newValue
            if newValue {
                verifyMobile()
            }
        }
    }
    lazy var timer: NSTimer = {
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timeFired), userInfo: nil, repeats: true)
        return timer
    }()
    
    var mobile:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        // Do any additional setup after loading the view.
        mobileLabel.text = mobile
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        timer.fire()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        codeTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    func timeFired() {
        if second > 1 {
            UIView.performWithoutAnimation({ 
                self.resendButton.setTitle("重新获取（\(self.second)）", forState: .Normal)
                self.resendButton.layoutIfNeeded()
            })
            
            resendButton.enabled = false
            second -= 1
        }else{
            UIView.performWithoutAnimation({ 
                self.resendButton.setTitle("重新获取", forState: .Normal)
                self.resendButton.layoutIfNeeded()
            })
            resendButton.enabled = true
        }
    }
    
    @IBAction func textFieldChanged(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        haveAppropriateInput = text.characters.count == ZeusConfig.verifyCodeLength()
    }
    
    @IBAction func resend_Touch(sender: AnyObject) {
        second = ZeusConfig.resendVerifyCodeSeconds()
    }

    @IBAction func finishLogin_Touch(sender: AnyObject) {
        verifyMobile()
    }
    
    func verifyMobile() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.startMainStory()
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
