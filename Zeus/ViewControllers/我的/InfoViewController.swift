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
    
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindActions()
    }
    
    func bindActions() {
        
        headCellView.tapAction = {[weak self] in
            
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.allowsEditing = true
            imagePickerVC.delegate = self
            imagePickerVC.sourceType = .PhotoLibrary
            
            let alertViewController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            alertViewController.addAction(UIAlertAction(title: "拍照", style: .Default, handler: { (action:UIAlertAction) in
                
                imagePickerVC.sourceType = .Camera
                self?.presentViewController(imagePickerVC, animated: true, completion: nil)
                
            }))
            alertViewController.addAction(UIAlertAction(title: "从手机相册选择", style: .Default, handler: { (action:UIAlertAction) in
                
                self?.presentViewController(imagePickerVC, animated: true, completion: nil)
                
            }))
            alertViewController.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: nil))
            
            self?.presentViewController(alertViewController, animated: true, completion: nil)
        }
        
        nameCellView.tapAction = {[weak self] in
            self?.jumpToEditInfoVC(EditInfo(infoType: EditInfoType.Name, value: "test"))
        }
        
        companyCellView.tapAction = {[weak self] in
            self?.jumpToEditInfoVC(EditInfo(infoType: EditInfoType.Company, value: "test"))
        }
        
        positionCellView.tapAction = {[weak self] in
            self?.jumpToEditInfoVC(EditInfo(infoType: EditInfoType.Position, value: "test"))
        }
    }

    func jumpToEditInfoVC(editInfo:EditInfo) -> Void {
        let editInfoVC = UIViewController.controllerWith(storyboardName: "EditInfoViewController", viewControllerId: "EditInfoViewController") as! EditInfoViewController
        editInfoVC.editInfo = editInfo
        editInfoVC.delegate = self
        navigationController?.pushViewController(editInfoVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

extension InfoViewController:EditInfoViewControllerDelegate{
    func editInfoViewControllerDidSaveEditInfo(editInfo: EditInfo) {
        switch editInfo.infoType {
        case .Name:
            nameLabel.text = editInfo.value
        case .Company:
            companyLabel.text = editInfo.value
        case .Position:
            positionLabel.text = editInfo.value
        }
    }
}

extension InfoViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        headImageView.image = image.imageByRoundCornerRadius(image.size.width)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
