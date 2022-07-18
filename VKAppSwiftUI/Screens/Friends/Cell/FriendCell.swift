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
    @State private var animationOn: Bool = false
//    @State private var angle: Double = 0
    
    let friend: UserItems
    
    var body: some View {
        HStack {
            KFImage(URL(string: friend.userPhoto))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50, alignment: .leading)
            .scaleEffect(animationOn ? 1.1 : 1)
            .animation(.interpolatingSpring(stiffness: 350, damping: 5),value: animationOn)
            .onTapGesture {
                self.animationOn.toggle()
            }
            Text("\(friend.fullName)")
    }
    }
}
