//
//  DJWCommonAlert.swift
//  DJWCommon
//
//  Created by dejaWorks on 29/10/2017.
//  Copyright © 2017 dejaWorks. All rights reserved.
//

import UIKit

open class DJWCommonAlert: NSObject {
    
    private override init() {
        super.init()
    }
    internal static var alertMessageController: UIAlertController!
    public static func displayAlertMessage(titleMessage:String, alertMsg:String){
        
        
        DJWCommonAlert.alertMessageController = UIAlertController(title: titleMessage,
                                                                  message: alertMsg,
                                                                  preferredStyle: UIAlertController.Style.alert)
        
        DJWCommonAlert.alertMessageController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        
        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
            controller.present(DJWCommonAlert.alertMessageController, animated: true, completion: nil)
        }
        else if let controller = UIApplication.shared.delegate?.window??.rootViewController{
            controller.present(DJWCommonAlert.alertMessageController,animated: true, completion: nil)
        }
        
        return
        
    }
}
