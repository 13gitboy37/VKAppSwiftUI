//
//  GroupsCellView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 04.07.2022.
//

import SwiftUI

struct GroupsCellView: View {
    var body: some View {
        HStack {
            Image("groupIcon")
                .resizable()
                .frame(width: 50, height: 50)
                .circleShadow(color: .purple, radius: 15)
            
            Text("Название группы")
                .lineLimit(1)
                .foregroundColor(.black)
                .font(.title2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .alignmentGuide(HorizontalAlignment.leading) { $0[.leading]
                }
                .overlay(Rectangle().fill(Color.red)
                    .shadow(color: .black,
                            radius: 5)
                        .opacity(0.5))
        }
    }
}

struct GroupsCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsCellView()
    }
}

extension View {
    func circleShadow(color: Color, radius: CGFloat) -> some View {
        return self.modifier(CircleShadow(shadowColor: .purple, shadowRadius: 10))
    }
}

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.orange)
                .shadow(color: shadowColor,
                        radius: shadowRadius))
    }
}
