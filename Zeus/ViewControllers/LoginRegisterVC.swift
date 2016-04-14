//
//  LoginRegisterVC.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/11.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import SnapKit

class LoginRegisterVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var registerButton: UIButton! {
        didSet{
            registerButton.backgroundColor = UIColor.zeusRegisterButtonTintColor()
        }
    }
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet{
            pageControl.currentPageIndicatorTintColor = UIColor.zeusRegisterButtonTintColor()
            pageControl.pageIndicatorTintColor = UIColor.zeusBorderColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func setupUI() {
        let firstView = firstStepVC().view
        let secondView = secondStepVC().view
        let thirdView = thirdStepVC().view
        
        let viewsDictionary = [
            "view": view,
            "stepA": firstView,
            "stepB": secondView,
            "stepC": thirdView,
            ]
        
        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[stepA(==view)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activateConstraints(vConstraints)
        
        let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[stepA(==view)][stepB(==view)][stepC(==view)]|", options: [.AlignAllBottom, .AlignAllTop], metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activateConstraints(hConstraints)
    }
    
    private func firstStepVC() -> ShowFirstStepVC {
        let firstStepVC = UIViewController.controllerWith(storyboardName: "LoginAndRegister", viewControllerId: "ShowFirstStepVC") as! ShowFirstStepVC
        
        firstStepVC.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(firstStepVC.view)
        
        addChildViewController(firstStepVC)
        firstStepVC.didMoveToParentViewController(self)
        return firstStepVC
    }
    
    private func secondStepVC() -> ShowSecondStepVC {
        let secondStepVC = UIViewController.controllerWith(storyboardName: "LoginAndRegister", viewControllerId: "ShowSecondStepVC") as! ShowSecondStepVC
        secondStepVC.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(secondStepVC.view)
        
        addChildViewController(secondStepVC)
        secondStepVC.didMoveToParentViewController(self)
        return secondStepVC
    }
    
    private func thirdStepVC() -> ShowThirdStepVC {
        let thirdStepVC = UIViewController.controllerWith(storyboardName: "LoginAndRegister", viewControllerId: "ShowThirdStepVC") as! ShowThirdStepVC
        
        thirdStepVC.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(thirdStepVC.view)
        
        addChildViewController(thirdStepVC)
        thirdStepVC.didMoveToParentViewController(self)
        return thirdStepVC
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

extension LoginRegisterVC: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let pageWidth = CGRectGetWidth(scrollView.bounds)
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        let page = Int(round(pageFraction))
        
        pageControl.currentPage = page
    }
}
