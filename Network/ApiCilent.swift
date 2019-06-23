//
//  File.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 22/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import Foundation

struct APIClient {
    static func fetchPhotos(text: String, completion: @escaping (_ success: Bool, _ photoResponse: PhotosResponse?) -> Void) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=f2ddfcba0e5f88c2568d96dcccd09602&format=json&nojsoncallback=1&safe_search=1&per_page=10&text=\(text)"
        
        let url = URL(string: urlString)!
        
       URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let responseData = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(PhotosResponse.self,
                                                    from: responseData)
                    completion(true, result)
                } catch {
                    completion(false, nil)
                }
            } else {
                completion(false, nil)
            }
            }.resume()
 
    }
}
