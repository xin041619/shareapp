//
//  BrowseViewController.swift
//  share
//
//  Created by xinxin wang on 11/5/14.
//  Copyright (c) 2014 com.xinxin. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items: [ShareItem] = []
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let rowNumber = indexPath.row
        var cell = tableView.dequeueReusableCellWithIdentifier("item") as ItemCell
        
        cell.itemName.text = items[rowNumber].name
        cell.itemDesc.text = items[rowNumber].description
        cell.itemImage.image = items[rowNumber].image
        
        return cell;
    }
    
    
}
