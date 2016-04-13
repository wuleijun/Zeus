//
//  VerifyMobileVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/12.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class VerifyMobileVC: BaseViewController {
    
    @IBOutlet private weak var nextButton: UIButton!{
        didSet{
            nextButton.enabled = false
        }
    }
    @IBOutlet private weak var mobileLabel: UILabel!
    @IBOutlet private weak var codeTextField: BorderTextField!
    @IBOutlet private weak var resendButton: UIButton!{
        didSet{
            resendButton.enabled = false
        }
    }
    
    var mobile:String?
    var haveAppropriateInput = false {
        willSet{
            nextButton.enabled = newValue
            if newValue {
                verifyMobile()
            }
        }
    }
    
    
    private var second = ZeusConfig.resendVerifyCodeSeconds()
    private lazy var timer:NSTimer = {
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        return timer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileLabel.text = mobile
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        codeTextField.becomeFirstResponder()
        timer.fire()
    }
    
    func timerFired() {
        if second > 1 {
            second = second - 1
            resendButton.enabled = false
            UIView.performWithoutAnimation({ 
                self.resendButton.setTitle("重新获取(\(self.second))", forState: .Normal)
                self.resendButton.layoutIfNeeded()
            })
            
        }else{
            UIView.performWithoutAnimation({ 
                self.resendButton.setTitle("重新获取", forState: .Normal)
                self.resendButton.layoutIfNeeded()
            })
            resendButton.enabled = true
        }
    }
    
    // MARK: Actions
    @IBAction func next_Touch(sender: AnyObject) {
       verifyMobile()
    }
    
    @IBAction func resendVerifyCode_Touch(sender: AnyObject) {
        second = ZeusConfig.resendVerifyCodeSeconds()
        
    }
    
    @IBAction func textFieldDidChanged(textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        haveAppropriateInput = text.characters.count == ZeusConfig.verifyCodeLength()
    }
    
    
    func verifyMobile() {
        self.performSegueWithIdentifier("showRegisterUserInfoVC", sender: nil)
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
