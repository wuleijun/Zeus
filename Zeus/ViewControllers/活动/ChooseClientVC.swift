//
//  ChooseClientVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/5.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

/// 选择我的客户VC
class ChooseClientVC: BaseViewController {
    
    let chooseClientCellId = "ChooseClientCell"
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.registerNib(UINib(nibName: chooseClientCellId, bundle: nil), forCellReuseIdentifier: chooseClientCellId)
            tableView.rowHeight = ChooseClientCell.heightOfCell()
        }
    }
    
    var selectedClients:[NSIndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirm_Touch(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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

// MARK: TableView DataSource
extension ChooseClientVC : UITableViewDataSource {

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let clientCell = tableView.dequeueReusableCellWithIdentifier(chooseClientCellId) as! ChooseClientCell
        clientCell.selecteImageView.highlighted = selectedClients.contains(indexPath)
        return clientCell
    }
}

// MARK: TableView Delegate
extension ChooseClientVC : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
        }
        if selectedClients.contains(indexPath) {
            if let index = selectedClients.indexOf(indexPath) {
                selectedClients.removeAtIndex(index)
            }
        }else{
            selectedClients.append(indexPath)
        }
        tableView.reloadRowAtIndexPath(indexPath, withRowAnimation: .Fade)
    }
    
}
