//
//  Video.swift
//  OSU_UWRT_BBOX
//
//  Created by Benjamin Hobson on 10/25/18.
//  Copyright © 2018 Benjamin Hobson. All rights reserved.
//

import Foundation
import Cocoa
import AVKit

class Video: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        var home = fm.homeDirectoryForCurrentUser.path // Gets the home dir
        home.remove(at: home.startIndex) // Takes off leading /
        let components = home.components(separatedBy: "/") // Seperates directory names at '/'
        let root = "/" + components[0] + "/" + components[1] // Retrieves 'Users' and CURRENT_USER
        let documentsUrl = root + "/Documents/BBox"
        
        if !dirExists(path: documentsUrl) { // Checks if 'BBox' folder exists
            do {
                try fm.createDirectory(atPath: root + "/Documents/BBox", withIntermediateDirectories: true, attributes: nil) // Attempts to create directory
                print("Created BBox directory")
            }
            catch let error as NSError {
                NSLog("Unable to create a BBox directory \n\n\(error.debugDescription)")
            }
        }
        
        if fm.fileExists(atPath: documentsUrl + "/Video.mp4") {
            guard let dataUrl = URL(string: documentsUrl + "/Video.mp4") else {
                return
            }
            let player = AVPlayer(url: URL(fileURLWithPath: dataUrl.path))
            playerView.player = player
        }
        
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
    
    @IBOutlet weak var playerView: AVPlayerView!
}
