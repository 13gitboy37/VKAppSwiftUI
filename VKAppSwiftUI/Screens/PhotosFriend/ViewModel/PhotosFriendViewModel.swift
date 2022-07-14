//
//  PhotosFriendViewModel.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 08.07.2022.
//

import Foundation

class PhotosFriendViewModel: ObservableObject {
    
    let friend: UserItems
    
    let networkService = NetworkService()
    
    @Published var photos: [String] = []
    
    init(friend: UserItems) {
        self.friend = friend
    }
    
    public func fetchPhoto(id: Int) {
        networkService.getPhotos(ownerID: id) { [weak self] result in
            switch result {
            case .success(let photosJSON):
                photosJSON.forEach { photo in
                    DispatchQueue.main.async {
                        self?.photos.append(photo.sizes.first?.urlPhoto ?? "")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
