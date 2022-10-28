//
//  PhotosItems.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 09.07.2022.
//

import Foundation

struct PhotosResponse {
    let photos: Photos
}

extension PhotosResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case photos = "response"
    }
}

struct Photos {
    let items: [PhotosItems]
}

extension Photos: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct PhotosItems {
    let ownerID: Int
    let sizes: [PhotosSizes]
}

extension PhotosItems: Codable {
    enum CodingKeys: String, CodingKey {
        case ownerID = "owner_id"
        case sizes = "sizes"
    }
}

struct PhotosSizes {
    let urlPhoto: String
}

extension PhotosSizes: Codable {
    enum CodingKeys: String, CodingKey {
        case urlPhoto = "url"
    }
}
