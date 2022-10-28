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
        ZStack {
            KFImage(URL(string: photo))
            .resizable()
            ZStack {
            Image(systemName: "heart.fill")
                .opacity(likeTapped ? 1 : 0)
                .scaleEffect(likeTapped ? 1.0 : 0.1)
                .animation(.linear, value: likeTapped)
            Image(systemName: "heart")
        }.font(.system(size: 40))
            .onTapGesture {
                self.likeTapped.toggle()
        }
        .foregroundColor(likeTapped ? .red : .white)
    }
//        .frame(width: 100, height: 100, alignment: .center)
    }
}

