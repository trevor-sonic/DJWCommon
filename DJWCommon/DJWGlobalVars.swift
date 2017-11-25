//
//  DJWGlobalVars.swift
//  DJWCommon
//
//  Created by dejaWorks on 08/07/2017.
//  Copyright © 2017 dejaWorks. All rights reserved.
//
import Foundation

open class DJWGlobalVars: NSObject {
    
    public override init() {
        super.init()
        
    }
    
    open lazy var appVersion:String = {
            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                return version
            }
            return "unknown version"
    }()
    open lazy var appBuild:String = {
        if let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                return version
            }
            return "unknown bundle version"
        
    }()
}
