//
//  Groups.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    @State private var animationOn: Bool = false
    
    let group: GroupsItems
    
    var body: some View {
        
        HStack {
            KFImage(URL(string: group.groupsPhoto))
                .resizable()
                .frame(width: 50, height: 50)
                .circleShadow(color: .purple, radius: 15)
                .scaleEffect(animationOn ? 1.1 : 1)
                .animation(.interpolatingSpring(stiffness: 350, damping: 5),value: animationOn)
                .onTapGesture {
                    self.animationOn.toggle()
                }
            
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
