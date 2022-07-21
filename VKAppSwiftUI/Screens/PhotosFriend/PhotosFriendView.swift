//
//  PhotosFriendView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI

struct PhotosFriendView: View {
    
    @ObservedObject var viewModel: PhotosFriendViewModel
    
    init(viewModel: PhotosFriendViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        GeometryReader { geometry in
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))],alignment: .center) {
                ForEach(0..<viewModel.photos.count, id: \.self) { index in
                    PhotoCellView(photo: viewModel.photos[index])
                        .frame(height: geometry.size.width / 3)
                }
            }
        }
        }
        .onAppear {
                viewModel.fetchPhoto(id: viewModel.friend.id)
            }
        Spacer()
            .navigationBarTitle("Photos \(viewModel.friend.fullName)`s", displayMode: .inline)
    }
}


