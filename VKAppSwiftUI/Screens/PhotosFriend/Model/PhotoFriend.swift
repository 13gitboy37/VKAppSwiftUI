//
//  PhotoFriend.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import Foundation

class PhotoFriend: Identifiable {
    let id: UUID = UUID()
    let photoURL: String
    
    internal init(photoURL: String) {
        self.photoURL = photoURL
    }
}
