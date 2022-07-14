//
//  SwiftUIView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 08.07.2022.
//

import SwiftUI
import Kingfisher

struct PhotoCellView: View {
    let photo: String
    
    var body: some View {
        KFImage(URL(string: photo))
            .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
    }
}

