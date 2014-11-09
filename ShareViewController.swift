//
//  ShareViewController.swift
//  share
//
//  Created by xinxin wang on 11/2/14.
//  Copyright (c) 2014 com.xinxin. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var shareItem: ShareItem?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBAction func cameraButton(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            var picker : UIImagePickerController = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.delegate = self
            picker.allowsEditing = false
            self.presentViewController(picker, animated: true, completion: nil)
            
        } else {
            var alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Okay", style: .Default, handler: {(alertAction) in alert.dismissViewControllerAnimated(true, completion: nil)})

            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func photoButton(sender: AnyObject) {
        var picker: UIImagePickerController = UIImagePickerController()

        picker.delegate = self
        
        picker.allowsEditing = false
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender as? NSObject != self.saveButton {
            return
        }
                
        if self.itemNameTextField.text.utf16Count > 0 && self.itemDescriptionTextField.text.utf16Count > 0 {
            
            let destViewController = segue.destinationViewController as MainViewController
            
            destViewController.items.append(ShareItem(name: self.itemNameTextField.text, description: self.itemDescriptionTextField.text, image:self.photoImageView.image!))

        }
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let dict: NSDictionary = info as NSDictionary
        
        let image: UIImage = dict.objectForKey("UIImagePickerControllerOriginalImage") as UIImage
        
        photoImageView.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
}


