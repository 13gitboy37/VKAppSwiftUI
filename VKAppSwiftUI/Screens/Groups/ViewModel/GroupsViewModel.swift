//
//  GroupsViewModel.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 14.07.2022.
//

import Foundation

class GroupsViewModel: ObservableObject {
    
    @Published var groups: [GroupsItems] = []
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService

    }
    
    public func fetchGroups() {
        networkService.getGroups() { [weak self] result in
            switch result {
            case let .success(groups):
                DispatchQueue.main.async {
                    self?.groups = groups
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
