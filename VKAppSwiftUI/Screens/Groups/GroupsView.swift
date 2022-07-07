//
//  GroupsCellView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 04.07.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @State private var groups: [Group] = [
        Group(name: "News", imageName: "groupIcon"),
        Group(name: "CyberSport", imageName: "groupIcon"),
        Group(name: "I love Swift", imageName: "groupIcon"),
        Group(name: "All of SwiftUI", imageName: "groupIcon")
    ]
    
    var body: some View {
        List(groups.sorted(by: { $0.name < $1.name
        })) { group in
            GroupCell(group: group)
        }
    }
}

struct GroupsCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}


