//
//  ViewController.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 21/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var detailsButton: UIButton! {
        didSet {
            detailsButton.addTarget(self, action: #selector(didTapDetailsButton(_:)), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    func didTapAddButton(_ button: UIButton) {
        
        let viewController = PostContentViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    func didTapDetailsButton(_ button: UIButton) {
        let article = Article(image: UIImage(), label: "T##String?", text: "T##String?")
        let viewController = DetailsViewController(article: article)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

