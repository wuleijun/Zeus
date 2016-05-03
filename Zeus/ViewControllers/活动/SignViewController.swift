//
//  SignViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 签到界面
class SignViewController: BaseViewController {
    
    let signClientCell = "SignClientCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.rowHeight = SignClientCell.heightOfCell()
            tableView.registerNib(UINib(nibName: signClientCell, bundle: nil), forCellReuseIdentifier: signClientCell)
        }
    }
    @IBOutlet weak var progressHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var topView: UIView!{
        didSet{
            topView.backgroundColor = UIColor.zeusNavigationBarTintColor()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1.0) {
            self.progressView.progress = 0.5
            self.progressView.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressHeightConstraint.constant = 5
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        // Do any additional setup after loading the view.
    }

    @IBAction func moreOperation_Touch(sender: AnyObject) {
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

extension SignViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientCell = tableView.dequeueReusableCellWithIdentifier(signClientCell) as! SignClientCell
        return clientCell
    }

}
