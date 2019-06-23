//
//  ViewController.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 21/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    private var photosResponse: Blogs?
    @IBOutlet weak var SearchBar: UISearchBar!
    @objc func dismissKeyboard() {
        SearchBar.resignFirstResponder()
    }
  //  @IBOutlet weak var imageTest: UIImageView!
    @IBOutlet weak var tableView: UITableView!{
        
        
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 100
            tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SearchBar.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        APIClient.fetchPhotos(text: "hello") { (status, response) in
            if status {
                self.photosResponse = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        //imageTest.image = UIImage(named: "mona.jpg")
        //imageTest.downloaded(from: "https://tineye.com/images/widgets/mona.jpg")
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        APIClient.fetchPhotos(text: searchText) { (status, response) in
            if status {
                self.photosResponse = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photosResponse?.blogs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ArticleTableViewCell
     //   cell?.imageHolder.image = UIImage(named: "Phonepe.jpg")
        if let photo = self.photosResponse?.blogs[indexPath.row] {
            
            cell?.label?.text = photo.title
            
            cell?.summary?.text = photo.author
            cell?.imageHolder?.downloaded(from: photo.imageUrl ?? "https://tineye.com/images/widgets/mona.jpg")
            
        }
        
        
        
        return cell ?? UITableViewCell()
     /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ArticleTableViewCell
        if (self.photosResponse?.photos?.photo?[indexPath.row]) != nil {
            //cell?.image1?.image = UIImage(named: "mona.jpg")
            cell?.imageHolder?.downloaded(from:"https://tineye.com/images/widgets/mona.jpg")
            cell?.label?.text = photo.title
            cell?.summary?.text = photo.id
            
        }
  
        return cell ?? UITableViewCell()
 */
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print("hello")
       // print(indexPath)
//        var _:String,_:String;
        if let photo = self.photosResponse?.blogs[indexPath.row] {
            //cell?.image1?.image = UIImage(named: "mona.jpg")
            //cell?.imageHolder?.downloaded(from:"https://tineye.com/images/widgets/mona.jpg")
            //cell?.title?.text = photo.title
            //cell?.subTitle?.text = photo.id
     //   print("byee")
            let article = Article(imageUrl: photo.imageUrl ?? "https://tineye.com/images/widgets/mona.jpg", label: photo.title, text: photo.content
            )
            let viewController = DetailsViewController(article: article)
       //     print("hi")
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        
        
    }

/*
    @IBOutlet weak var detailsButton: UIButton! {
        didSet {
            detailsButton.addTarget(self, action: #selector(didTapDetailsButton(_:)), for: .touchUpInside)
        }
    }
  */
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
 /*
    
    @objc
    func didTapDetailsButton(_ button: UIButton) {
        let article = Article(image: UIImage(), label: "T##String?", text: "T##String?")
        let viewController = DetailsViewController(article: article)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
 */
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) { 
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        //print("dasdsda")
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
