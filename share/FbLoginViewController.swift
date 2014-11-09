//
//  FbLoginViewController.swift
//  share
//
//  Created by xinxin wang on 11/9/14.
//  Copyright (c) 2014 com.xinxin. All rights reserved.
//

import UIKit


var userDefaults = NSUserDefaults.standardUserDefaults()

class FbLoginViewController: UIViewController, FBLoginViewDelegate {
      
    
    @IBOutlet weak var fbLoginView: FBLoginView!
    
    var nameLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        self.view.addSubview(nameLabel)
        nameLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /* fb login delegate */
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        print("logged in")
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        print("logged out")

        nameLabel.hidden = true
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        print("username: \(user.name)")
        userDefaults.setObject(user.name, forKey: "username")

        nameLabel.center = CGPointMake(160, 150)
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.text = "Welcome: \(user.name)"
        nameLabel.hidden = false
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        print("error")
    }
    
}