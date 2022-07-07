//
//  Groups.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI

struct GroupCell: View {
    
    let group: Group
    
    var body: some View {
        
        HStack {
            Image("\(group.imageName)")
                .resizable()
                .frame(width: 50, height: 50)
                .circleShadow(color: .purple, radius: 15)
            
            Text("\(group.name)")
                .lineLimit(1)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .alignmentGuide(HorizontalAlignment.leading) { $0[.leading]
                }
        }
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
