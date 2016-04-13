//
//  FeedbackViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/11.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import KeyboardMan

class FeedbackViewController: BaseViewController {

    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var feedBackTextView: UITextView!{
        didSet{
            feedBackTextView.text = ""
            feedBackTextView.delegate = self
            feedBackTextView.textContainerInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        }
    }
    @IBOutlet private weak var doneButton: UIButton!{
        didSet{
            doneButton.enabled = false
        }
    }
    var keyboardMan = KeyboardMan()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardMan.animateWhenKeyboardAppear = { [weak self] _, keyboardHeight, _ in
            self?.textViewBottomConstraint.constant = keyboardHeight
            self?.view.layoutIfNeeded()
        }
        keyboardMan.animateWhenKeyboardDisappear = { [weak self] keyboardHeight in
            self?.textViewBottomConstraint.constant = 60
            self?.view.layoutIfNeeded()
        }
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        feedBackTextView.becomeFirstResponder()
    }
    
    @IBAction func done_Touch(sender: AnyObject) {

        feedBackTextView.resignFirstResponder()
        
        ZeusHud.showActivityIndicator()
        delay(20) {
            ZeusHud.hideActivityIndicator()
            ZeusAlert.alert(title: "成功", message: "感谢您的反馈，EMM已记录！", dismissTitle: "确定", inViewController: self) {
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
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

extension FeedbackViewController:UITextViewDelegate {
    func textViewDidChange(textView: UITextView) {
        guard let text = textView.text else {
            return
        }
        doneButton.enabled = !text.isEmpty
    }
}
