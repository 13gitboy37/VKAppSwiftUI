//
//  FriendCell.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI
import Kingfisher
import CoreData

struct FriendCell: View {
    
    let friend: UserItems
    
    var body: some View {
        HStack {
            KFImage(URL(string: friend.userPhoto))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50, alignment: .leading)
            Text("\(friend.fullName)")
    }
    }
}
