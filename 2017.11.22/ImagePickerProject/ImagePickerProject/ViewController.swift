//
//  ViewController.swift
//  ImagePickerProject
//
//  Created by Benny Davidovitz on 22/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func picAction(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        
        func handler(_ action : UIAlertAction){
            let picker = UIImagePickerController()
            
            switch action.title! {
            case "Rear Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .rear
            case "Selfie Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .front
            case "Photo Album":
                picker.sourceType = .photoLibrary
            default:
                return
            }
            
            picker.delegate = self
            
            self.present(picker, animated: true, completion: nil)
        }
        
        let rearAction = UIAlertAction(title: "Rear Camera", style: .default, handler: handler)
        let rearIcon = #imageLiteral(resourceName: "icons8-camera")
        rearAction.setValue(rearIcon, forKey: "image")
        rearAction.isEnabled = UIImagePickerController.isCameraDeviceAvailable(.rear)
        
        let frontAction = UIAlertAction(title: "Selfie Camera", style: .default, handler: handler)
        let frontIcon = #imageLiteral(resourceName: "icons8-selfie")
        frontAction.setValue(frontIcon, forKey: "image")
        frontAction.isEnabled = UIImagePickerController.isCameraDeviceAvailable(.front)
        
        let albumAction = UIAlertAction(title: "Photo Album", style: .destructive, handler: handler)
        let albumIcon = #imageLiteral(resourceName: "icons8-stack_of_photos")
        albumAction.setValue(albumIcon, forKey: "image")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        for obj in [rearAction,frontAction,albumAction,cancelAction]{
            actionSheet.addAction(obj)
        }
        
        //UIImageView.appearance(whenContainedInInstancesOf: UIViewController.self).tintColor = .white
    
        
        actionSheet.view.tintColor = .green
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    

}


extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //user pressed on cancel, close the picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //user provided cotent, handle it, and close the picker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
        }
        
        //close picker
        picker.dismiss(animated: true, completion: nil)
    }
    
}













