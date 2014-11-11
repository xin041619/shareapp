//
//  FirebaseStore.swift
//  share
//
//  Created by xinxin wang on 11/9/14.
//  Copyright (c) 2014 com.xinxin. All rights reserved.
//

import Foundation


class FirebaseStore {
    var myRootRef = Firebase(url: "https://xinxinshare.firebaseio.com/")
    
    
    
    func setValue(locationPath: String, value: String) {
        myRootRef.childByAppendingPath(locationPath).setValue(value)
    }
    
    func getValue(locationPath: String) {
        
        // Attach a closure to read the data at our posts reference
        myRootRef.childByAppendingPath(locationPath).observeEventType(
            .Value, withBlock: { snapshot in
            println(snapshot.value)
            }, withCancelBlock: { error in
                println(error.description)
        })
        
        
        
    }
}
