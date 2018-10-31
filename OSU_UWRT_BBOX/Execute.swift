//
//  Execute.swift
//  OSU_UWRT_BBOX
//
//  Created by Benjamin Hobson on 10/25/18.
//  Copyright © 2018 Benjamin Hobson. All rights reserved.
//

import Foundation
import Cocoa
import AVKit

class Execute: NSViewController {
    
    @IBOutlet var tableView: NSTableView!
    var data: [[String: String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        data = [
            ["firstName" : "Andrew"],
            ["firstName" : "Gabriel"],
            ["firstName" : "Olga"]
        ]
        
        self.tableView.reloadData()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

extension Execute: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return 3
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let item = (data!)[row]
        
        let cell = tableView.makeView(withIdentifier: (tableColumn!.identifier), owner: self) as? NSTableCellView
        cell?.textField?.stringValue = item[(Cell?.identifier)!]!
        return cell
    }
}
