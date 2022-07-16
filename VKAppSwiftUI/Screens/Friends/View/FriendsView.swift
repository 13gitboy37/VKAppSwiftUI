//
//  FriendsCellView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 04.07.2022.
//

import SwiftUI
import CoreData


struct FriendsView: View {

    @ObservedObject var viewModel: FriendViewModel
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
        viewModel.fetchFriends()
    }
    
    var body: some View {
        List(viewModel.friends.sorted(by: { $0.fullName < $1.fullName
        })) { friend in
            let photosViewModel = PhotosFriendViewModel(friend: friend)
            NavigationLink(destination: PhotosFriendView(viewModel: photosViewModel)) {
                FriendCell(friend: friend)
            }
        }
        }
}
