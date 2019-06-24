//
//  DetailsViewController.swift
//  project_2
//
//  Created by Devesh Prajapat on 21/06/19.
//  Copyright © 2019 Devesh Prajapat. All rights reserved.
//

import UIKit

struct Article {
    
    var imageUrl: String
    var label: String?
    var text: String?
    

}

class DetailsViewController: UIViewController {
    
    private var article: Article
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.numberOfLines = 0 
        }
    }
    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var imageHolder: UIImageView!
    init(article: Article) {
        self.article = article
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  print(article.text)
       // print (article.label)
        content.text = article.text
        label.text = article.label
        self.label.sizeToFit()
        imageHolder.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleBottomMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleRightMargin.rawValue | UIView.AutoresizingMask.flexibleLeftMargin.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
            imageHolder.contentMode = UIView.ContentMode.scaleAspectFit
        imageHolder.downloaded(from: article.imageUrl)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
