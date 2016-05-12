//
//  ClientTypeVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/3/31.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import XLForm

class Test:NSObject,XLFormOptionObject {
    var name = "name"
    init(name:String){
        self.name = name
    }
    func formDisplayText() -> String {
        return "test"
    }
    
    func formValue() -> AnyObject {
        return self
    }
}
class ClientTypeVC: UIViewController,XLFormRowDescriptorViewController {

    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            
        }
    }
    
    var rowDescriptor: XLFormRowDescriptor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rowDescriptor?.value = Test(name: "test")
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
