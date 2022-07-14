//
//  UserItems.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 09.07.2022.
//

import Foundation

struct UserResponse {
    let users: User
}

extension UserResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case users = "response"
    }
}

struct User {
    let items: [UserItems]
}

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

struct UserItems: Identifiable {
    let firstName: String
    let lastName: String
    let userPhoto: String
    let id: Int
    var fullName: String {lastName + " " + firstName}
}

extension UserItems: Codable {
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case userPhoto = "photo_100"
        case id = "id"
    }
}

extension UserItems: Comparable {
        static func < (lhs: UserItems, rhs: UserItems) -> Bool { lhs.lastName < rhs.lastName }
}

