//
//  Settings.swift
//  OSU_UWRT_BBOX
//
//  Created by Benjamin Hobson on 10/25/18.
//  Copyright © 2018 Benjamin Hobson. All rights reserved.
//

import Foundation
import Cocoa
import AVKit

class Settings: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func dirExists(path: String) -> Bool {
        var isDirectory = ObjCBool(false)
        FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return isDirectory.boolValue
    }
    
}
