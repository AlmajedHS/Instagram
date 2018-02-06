//
//  CameraViewController.swift
//  Instgram
//
//  Created by Hussain Almajed on 2/4/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import UIKit
class CameraViewController: UIViewController {
    
    @objc func tabG(_ sender: Any) {
        print("???")
    
        self.instantiateImagePickerController()
        
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        
        postImView.image = nil
        
        NotificationCenter.default.post(name: NSNotification.Name("goMain"), object: nil)
      
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        print("?here?")
        self.instantiateImagePickerController()
        
    }
    @IBAction func shareButton(_ sender: UIButton) {
        
       
        Post.postUserImage(image: postImView.image, withCaption: captionField.text) { (success: Bool, error: Error?) in
            if success {
                self.postImView.image = nil
                NotificationCenter.default.post(name: NSNotification.Name("goMain"), object: nil)
            } else {
             
                print("error: \(error)")
            }
        }
        
    }
    
    @IBOutlet weak var postImView: UIImageView!
    
    @IBOutlet weak var captionField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gest = UITapGestureRecognizer()
        gest.addTarget(self, action: #selector(self.tabG(_:)))
        postImView.addGestureRecognizer(gest)
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func instantiateImagePickerController() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            print("Camera is available 📸")
//            vc.sourceType = .camera
//        } else {
//            print("Camera 🚫 available so we will use photo library instead")
//            vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        }
//        
        
        self.present(vc, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        postImView.image = editedImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    
}
 

