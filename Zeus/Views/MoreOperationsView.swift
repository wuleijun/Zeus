//
//  MoreOperationsView.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/3.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

class MoreOperationsView: UIView {

    static let rowHeight:CGFloat = 50
    let totalHeight: CGFloat = rowHeight * 5
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        
        view.separatorInset = UIEdgeInsetsZero
        view.dataSource = self
        view.delegate = self
        view.rowHeight = rowHeight
        view.scrollEnabled = false
        
        view.registerClass(OperationCell.self, forCellReuseIdentifier: "OperationCell")
        view.registerClass(CancelCell.self, forCellReuseIdentifier: "CancelCell")
        return view
    }()
    
    var createTextAndPhotosFeedAction: (() -> Void)?
    var createVoiceFeedAction: (() -> Void)?
    var createShortMovieFeedAction: (() -> Void)?
    var createLocationFeedAction: (() -> Void)?
    
    var tableViewBottomConstraint: NSLayoutConstraint?
    
    func showInView(view: UIView) {
        
        frame = view.bounds
        
        view.addSubview(self)
        
        layoutIfNeeded()
        
        containerView.alpha = 1
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveEaseIn, animations: {[weak self]  _ in
            self?.containerView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
            
            }, completion: { _ in
        })
        
        UIView.animateWithDuration(0.2, delay: 0.1, options: .CurveEaseOut, animations: {[weak self]  _ in
            self?.tableViewBottomConstraint?.constant = 0
            
            self?.layoutIfNeeded()
            
            }, completion: { _ in
        })
    }
    
    func hide() {
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveEaseIn, animations: {[weak self]  _ in
            
            if let strongSelf = self {
                strongSelf.tableViewBottomConstraint?.constant = strongSelf.totalHeight
            }
            
            self?.layoutIfNeeded()
            
            }, completion: { _ in
        })
        
        UIView.animateWithDuration(0.2, delay: 0.1, options: .CurveEaseOut, animations: {[weak self]  _ in
            self?.containerView.backgroundColor = UIColor.clearColor()
            
            }, completion: {[weak self]  _ in
                self?.removeFromSuperview()
            })
    }
    
    func hideAndDo(afterHideAction: (() -> Void)?) {
        
        UIView.animateWithDuration(0.2, delay: 0.0, options: .CurveLinear, animations: {[weak self]  _ in
            self?.containerView.alpha = 0
            
            if let strongSelf = self {
                strongSelf.tableViewBottomConstraint?.constant = strongSelf.totalHeight
            }
            
            
            self?.layoutIfNeeded()
            
            }, completion: {[weak self]  finished in
                self?.removeFromSuperview()
            })
        
        delay(0.1) {
            afterHideAction?()
        }
    }
    
    var isFirstTimeBeenAddAsSubview = true
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if isFirstTimeBeenAddAsSubview {
            isFirstTimeBeenAddAsSubview = false
            
            makeUI()
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(hide))
            containerView.addGestureRecognizer(tap)
            
            tap.cancelsTouchesInView = true
            tap.delegate = self
        }
    }
    
    func makeUI() {
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsDictionary = [
            "containerView": containerView,
            "tableView": tableView,
            ]
        
        // layout for containerView
        
        let containerViewConstraintsH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let containerViewConstraintsV = NSLayoutConstraint.constraintsWithVisualFormat("V:|[containerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activateConstraints(containerViewConstraintsH)
        NSLayoutConstraint.activateConstraints(containerViewConstraintsV)
        
        // layour for tableView
        
        let tableViewConstraintsH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let tableViewBottomConstraint = NSLayoutConstraint(item: tableView, attribute: .Bottom, relatedBy: .Equal, toItem: containerView, attribute: .Bottom, multiplier: 1.0, constant: self.totalHeight)
        
        self.tableViewBottomConstraint = tableViewBottomConstraint
        
        let tableViewHeightConstraint = NSLayoutConstraint(item: tableView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.totalHeight)
        
        NSLayoutConstraint.activateConstraints(tableViewConstraintsH)
        NSLayoutConstraint.activateConstraints([tableViewBottomConstraint, tableViewHeightConstraint])
    }
}

// MARK: - UIGestureRecognizerDelegate

extension MoreOperationsView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        
        if touch.view != containerView {
            return false
        }
        
        return true
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MoreOperationsView: UITableViewDataSource, UITableViewDelegate {
    
    enum Row: Int {
        case Allocation = 0
        case ClientInvite
        case AuthSign
        case Sign
        case Cancel
        var title: String {
            switch self {
            case .Allocation:
                return "名额分配"
            case .ClientInvite:
                return "客户邀请"
            case .AuthSign:
                return "授权签到"
            case .Sign:
                return "签到"
            case .Cancel:
                return "取消"
            }
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let row = Row(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        
        switch row {
            
        case .Cancel:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("CancelCell") as! CancelCell
            
            cell.colorTitleLabel.text = row.title
            cell.colorTitleLabelTextColor = UIColor.zeusDefaultTextColor()
            cell.colorTitleLabelFontStyle = .Light
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCellWithIdentifier("OperationCell") as! OperationCell
            
            cell.colorTitleLabel.text = row.title
            cell.colorTitleLabelTextColor = UIColor.zeusDefaultTextColor()
            cell.colorTitleLabelFontStyle = .Light
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        
        if let row = Row(rawValue: indexPath.row) {
            
            switch row {
                
            case .Allocation:
                createTextAndPhotosFeedAction?()
                hide()
                
            case .ClientInvite:
                createVoiceFeedAction?()
                hide()
                
                //case .ShortMovie:
                //    createShortMovieFeedAction?()
                //    hide()
                
            case .AuthSign:
                createLocationFeedAction?()
                hide()
            case .Sign:
                hide()
            case .Cancel:
                hide()
            }
        }
    }
}