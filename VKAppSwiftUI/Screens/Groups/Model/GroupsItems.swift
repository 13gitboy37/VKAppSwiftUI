//
//  GroupsItems.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 09.07.2022.
//

import Foundation

struct GroupsResponse {
    let groups: Groups
}

extension GroupsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case groups = "response"
    }
}

struct Groups {
    let items: [GroupsItems]
}

extension Groups: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct GroupsItems: Identifiable {
    let id: Int
    let name: String
    let groupsPhoto: String
}

extension GroupsItems: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case groupsPhoto = "photo_100"
    }
}
