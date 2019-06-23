//
//  File.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 22/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import Foundation

struct APIClient {
    static func fetchPhotos(text: String, completion: @escaping (_ success: Bool, _ blogResponse: Blogs?) -> Void) {
        //let urlString = "10.128.2.240?search=\(text)"
        var urlString:String?
        if((urlString) != nil){
         urlString = "http://192.168.43.174:8080/blog/\(text)"
        }
        else{
            urlString=
        }
            
        guard let url = URL(string: urlString ?? <#default value#>) else { return  }
        
       URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let responseData = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Blogs.self,from: responseData)
                    completion(true, result)
                } catch {
                    print("asdsadsa")
                    completion(false, nil)
                }
            } else {
                completion(false, nil)
            }
            }.resume()
 
    }
}
