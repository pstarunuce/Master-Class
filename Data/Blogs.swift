//
//  Blogpe.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 23/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import Foundation
struct  Blogs: Codable{
    var blogs: [Blog]
}
struct Blog: Codable
{
    
    var title : String?
    var content : String?
    var imageUrl : String?
    var author : String?
    var blogId:Int
    
    
}

