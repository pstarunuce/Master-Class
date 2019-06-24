//
//  ViewController.swift
//  Hackathon_Fresher
//
//  Created by Pulkit Karira on 21/06/19.
//  Copyright © 2019 Pulkit Karira. All rights reserved.
//

import UIKit

class PostContentViewController: UIViewController,UIImagePickerControllerDelegate {
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var contentImageView: UIImageView!
    @IBAction func imgButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
    }
    }
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        print("sdsfsf")
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        contentImageView.image = image
    }

}
