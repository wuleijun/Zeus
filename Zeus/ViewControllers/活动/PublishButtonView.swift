//
//  PublishButtonView.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/4/1.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit
import SnapKit

@objc protocol PublishButtonViewDelegate {
    func publishButtonViewDidTouchButton()
}

class PublishButtonView: UIView {

    weak var delegate:PublishButtonViewDelegate?
    lazy var publishButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.zeusPublishButtonBackgroundColor()
        button.addTarget(self, action: #selector(publishAction), forControlEvents: .TouchUpInside)
        button.setTitle("发布", forState: .Normal)
        return button
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.addSubview(publishButton)
        publishButton.snp_makeConstraints { (make) in
            make.center.equalTo(self.snp_center)
            make.left.equalTo(30)
            make.height.equalTo(40)
        }
    }
    
    func publishAction(){
        if let delegate = delegate  {
            delegate.publishButtonViewDidTouchButton()
        }
    }
    
     override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
