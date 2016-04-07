//
//  InfoViewController.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/6.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class InfoViewController: BaseViewController {

    @IBOutlet weak var headCellView: CellBaseContainerView!
    @IBOutlet weak var nameCellView: CellBaseContainerView!
    @IBOutlet weak var companyCellView: CellBaseContainerView!
    @IBOutlet weak var positionCellView: CellBaseContainerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        headCellView.tapAction = {[weak self] in
            self?.performSegueWithIdentifier("showEditInfoViewController", sender: nil)
        }
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
