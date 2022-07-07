//
//  Friend.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import Foundation

class Friend: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageName: String
    
    internal init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
