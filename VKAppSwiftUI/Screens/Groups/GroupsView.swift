//
//  GroupsCellView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 04.07.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @ObservedObject var viewModel: GroupsViewModel
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
        viewModel.fetchGroups()
    }
    
    var body: some View {
        List(viewModel.groups.sorted(by: { $0.name < $1.name
        })) { group in
            GroupCell(group: group)
        }
    }
}



