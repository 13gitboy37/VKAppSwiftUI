//
//  FriendsCellView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 04.07.2022.
//

import SwiftUI



struct FriendsView: View {
    @State private var friends: [Friend] = [
    Friend(name: "Paul Rodriguez", imageName: "friendIcon"),
    Friend(name: "Stevie Jobs", imageName: "friendIcon"),
    Friend(name: "Sergey Brin", imageName: "friendIcon"),
    Friend(name: "Jeffrey Bezos", imageName: "friendIcon")
    ]
    var body: some View {
        List(friends.sorted(by: { $0.name < $1.name
        })) { friend in
            NavigationLink(destination: PhotosFriendView(friend: friend)) {
                FriendCell(friend: friend)
            }
        }
    }
}

struct FriendsCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

extension View {
    func debug() -> some View {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
