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
                                                                  preferredStyle: UIAlertControllerStyle.alert)
        
        DJWCommonAlert.alertMessageController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        if let controller = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
            controller.present(DJWCommonAlert.alertMessageController,
                               animated: true,
                               completion: nil)
        }
        else{
            UIApplication.shared.delegate?.window!!.rootViewController?.present(DJWCommonAlert.alertMessageController,
                                                                                animated: true,
                                                                                completion: nil)
        }
        
        return
        
    }
}
