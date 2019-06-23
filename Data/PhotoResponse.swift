//
//  model.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 22/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import Foundation
import Foundation


struct PhotosResponse: Codable {
    var stat: String?
    var photos: Photos?
}

struct Photos: Codable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: String?
    var photo: [Photo]?
}

struct Photo: Codable {
    var id: String?
    var secret: String?
    var farm : Int?
    var server: String?
    var title: String?
}

