//
//  CommonFS.swift
//  ZoomNavigation
//
//  Created by dejaWorks on 18/06/2017.
//  Copyright © 2017 dejaWorks. All rights reserved.
//
import Foundation
import UIKit

open class DJWBaseFileService: NSObject {
    
    public unowned let fm = FileManager.default
 
    /////////////////////////////////////////////////////////////
    // MARK: - Init File system
    override public init() {
        super.init()
        print("init CommonFS")
        print("\ndocsURL.path: \(docsURL.path)")
    }
    /////////////////////////////////////////////////////////////
    public lazy var docsURL: URL = {
        let fileManager = FileManager.default
        let dirPaths    = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let dURL        = dirPaths[0]
        //print("lazy var docsURL: (init here)")
        return dURL
    }()
    
    public lazy var tmpURL: URL = {
        // The template string
        let td = URL(fileURLWithPath: NSTemporaryDirectory()) as URL
        return td
    }()
    
}
