//
//  ContainerView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI

struct ContainerView: View {
    @State private var showFriendsScreen = false
    
    var body: some View {
        NavigationView {
            HStack {
                MainView()
            }
        }
    }
}
