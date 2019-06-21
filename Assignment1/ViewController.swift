//
//  ViewController.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 21/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var photosResponse: PhotosResponse?
    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        Table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        APIClient.fetchPhotos(text: "cars") { (status, response) in
            if status {
                self.photosResponse = response
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.photosResponse?.photos?.photo = []
                    self.tableView.reloadData()
                }
            }
        }
     
        
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photosResponse ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let photo = self.photosResponse?.photos?.photo?[indexPath.row] {
            cell.textLabel?.text = photo.title
            cell.detailTextLabel?.text = photo.id
        }
        
        return cell
    }
}


