//
//  FriendViewModel.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 12.07.2022.
//

import SwiftUI
import CoreData

class FriendViewModel: ObservableObject {
    
    @Published var friends: [UserItems] = []
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService

    }
    
    public func fetchFriends() {
        networkService.getFriends { [weak self] result in
            switch result {
            case let .success(friends):
                DispatchQueue.main.async {
                    self?.friends = friends
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
