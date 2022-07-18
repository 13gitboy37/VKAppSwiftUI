//
//  SwiftUIView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 08.07.2022.
//

import SwiftUI
import Kingfisher

struct PhotoCellView: View {
    
    @State private var likeTapped: Bool = false
    @State private var image: String = ""
    
    
    let photo: String
    
    var body: some View {
        
        VStack {
            KFImage(URL(string: photo))
                .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
        Button {
            self.likeTapped.toggle()
        } label: {
            HStack {
            Image(systemName: "heart.fill")
                    .foregroundColor(likeTapped ? .red : .gray)
            Text(likeTapped ? "1" : "0")
            }
            .animation(.interpolatingSpring(stiffness: 350, damping: 5), value: likeTapped)
            .frame(idealWidth: 40, maxWidth: 40, idealHeight: 10, maxHeight: 10, alignment: .trailing)
        }
        .buttonStyle(.borderless)
        .padding(.top, -4)
        }
    }
}

