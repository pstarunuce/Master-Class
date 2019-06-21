//
//  ViewController.swift
//  Hackathon_Fresher
//
//  Created by Pulkit Karira on 21/06/19.
//  Copyright © 2019 Pulkit Karira. All rights reserved.
//

import UIKit

class PostContentViewController: UIViewController,UIImagePickerControllerDelegate {

    @IBOutlet weak var authorName: UITextField!
    @IBOutlet weak var content: UITextField!
    @IBOutlet weak var contentHeading: UITextField!
    
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var postContent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

