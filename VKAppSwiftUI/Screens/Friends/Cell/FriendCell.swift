//
//  FriendCell.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI

struct FriendCell: View {
    
    let friend: Friend
    
    var body: some View {
        
        HStack {
        Image(friend.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50, alignment: .leading)
        Text("\(friend.name)")
    }
    }
}
