//
//  ShareTableViewController.swift
//  share
//
//  Created by xinxin wang on 11/2/14.
//  Copyright (c) 2014 com.xinxin. All rights reserved.
//

import UIKit

class ShareTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        let cell: ShareInputFieldCell = ShareInputFieldCell();
        cell.load(String(indexPath.row))
        return cell;

    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as? ShareInputFieldCell
        
        print(cell?.labelText)

    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}
