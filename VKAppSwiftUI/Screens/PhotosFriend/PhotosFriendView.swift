//
//  PhotosFriendView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI
import ASCollectionView

struct PhotosFriendView: View {
    
    var friend: Friend
    
    @State var photos = [
        PhotoFriend(photoURL: "person.fill"),
        PhotoFriend(photoURL: "person.3"),
        PhotoFriend(photoURL: "person.fill"),
        PhotoFriend(photoURL: "person.3")
    ]
    
    var body: some View {
//        ASCollectionView(data: photos) { photo, context in
//            return PhotoView(photo: photo)
//        }.layout {
//            .grid(
//                layoutMode:
//                        .fixedNumberOfColumns(3),
//                        itemSpacing: 0,
//                        lineSpacing: 16)
//        }
//        .navigationBarTitle("Photos \(friend.name)")
//    }
        Image(systemName: "person")
    }
}

struct PhotoView: View {
    let photo: PhotoFriend
    
    var body: some View {
        Image(systemName: photo.photoURL)
            .resizable()
            .frame(width: 200, height: 200, alignment: .leading)
    }
}
