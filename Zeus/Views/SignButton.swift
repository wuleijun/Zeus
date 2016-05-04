//
//  SignButton.swift
//  Zeus
//
//  Created by 吴蕾君 on 16/5/4.
//  Copyright © 2016年 rayjuneWu. All rights reserved.
//

import UIKit

enum SignStatus:Int {
    case Normal,Signed
}

class SignButton: UIButton {

    var signStatus:SignStatus = .Normal {
        didSet{
            if signStatus == .Normal {
                enabled = true
            }else{
                enabled = false
            }
        }
    }
    
    private lazy var nomalBackgroundImage:UIImage? = {
        var image = UIImage(color: UIColor.zeusRegisterButtonTintColor(),size: self.size)
        let borderImage = image?.imageByRoundCornerRadius(5)
        return borderImage
    }()
    
    private lazy var disableBackgroundImage:UIImage? = {
        var image = UIImage(color:UIColor.zeusDisableButtonBackgroundColor(),size: self.size)
        let borderImage = image?.imageByRoundCornerRadius(5)
        return borderImage
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    func makeUI() {
        setBackgroundImage(nomalBackgroundImage, forState: .Normal)
        setBackgroundImage(disableBackgroundImage, forState: .Disabled)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
