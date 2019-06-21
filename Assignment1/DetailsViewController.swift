//
//  DetailsViewController.swift
//  project_2
//
//  Created by Devesh Prajapat on 21/06/19.
//  Copyright © 2019 Devesh Prajapat. All rights reserved.
//

import UIKit

struct Article {
    
    var image: UIImage?
    var label: String?
    var text: String?
    

}

class DetailsViewController: UIViewController {
    
    private var article: Article
    
    init(article: Article) {
        self.article = article
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
