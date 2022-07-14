//
//  MainView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 07.07.2022.
//

import SwiftUI

struct MainView: View {
    let tabs = ["Friends", "Groups"]
    
    let networkService = NetworkService()
    
    @State private var selection: String
    
    init() {
        _selection = State(initialValue: tabs[0])
    }
    
    var body: some View {
        TabView(selection: $selection, content: {
            let friendViewModel = FriendViewModel(networkService: networkService)
            let groupsViewModel = GroupsViewModel(networkService: networkService)
            FriendsView(viewModel: friendViewModel)
                .tabItem {
                    Label("Friend", systemImage: "person")
                }.tag(tabs[0])
            GroupsView(viewModel: groupsViewModel)
                .tabItem {
                    Label("Group", systemImage: "person.3")
                }
                .tag(tabs[1])
        })
        .navigationBarTitle(selection)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
