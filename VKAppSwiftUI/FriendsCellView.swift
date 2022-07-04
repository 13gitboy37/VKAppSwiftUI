//
//  FriendsCellView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 04.07.2022.
//

import SwiftUI

struct FriendsCellView: View {
    var body: some View {
        HStack {
            Image("friendIcon")
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFit()
                .clipped()
                .alignmentGuide(HorizontalAlignment.trailing) { $0[.leading]}
                .background(Circle().fill(Color.blue).shadow(color: . black, radius: 5))
            Text("Фамилия Имя")
                .lineLimit(1)
                .foregroundColor(.black)
                .font(.title2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .alignmentGuide(HorizontalAlignment.leading) { $0[.leading]
                }
                .overlay(Rectangle().fill(Color.yellow)
                    .shadow(color: .purple,
                            radius: 5)
                        .opacity(0.5))
        }
    }
}

struct FriendsCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsCellView()
    }
}

extension View {
    func debug() -> some View {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
