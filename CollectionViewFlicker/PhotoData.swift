//
//  PhotoData.swift
//  CollectionViewFlicker
//
//  Created by Admin on 11/03/2022.
//

import Foundation

struct PhotoData: Decodable {
    let photos: Photos
    let stat: String
}

struct Photos: Decodable {
    let page: Int
    let pages: Int
    let perPage: Int
    let total: Int
    let photo: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case page
        case pages
        case perPage = "perpage"
        case total
        case photo
    }
}

struct Photo: Decodable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
}
