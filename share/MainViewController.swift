//
//  ViewController.swift
//  share
//
//  Created by xinxin wang on 10/19/14.
//  Copyright (c) 2014 com.xinxin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var items = [ShareItem]()
    
    @IBOutlet weak var browseButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        items.append(ShareItem(name: "test", description: "xinxin"))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // unwind back from the next controller
    @IBAction func unwindList(segue: UIStoryboardSegue) {
        if segue.identifier == "shareSegueSave" {
            let shareViewController: ShareViewController = segue.sourceViewController as ShareViewController
            
            
            if shareViewController.shareItem != nil {
                items.append(shareViewController.shareItem!)
            }           
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject == self.browseButton {
            let destViewController = segue.destinationViewController as BrowseViewController
            destViewController.items = self.items
        }
    }

}

