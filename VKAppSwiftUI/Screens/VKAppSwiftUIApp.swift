//
//  VKAppSwiftUIApp.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 19.06.2022.
//

import SwiftUI

@main
struct VKAppSwiftUIApp: App {
    
    fileprivate static let tokenSavedPublisher = NotificationCenter.default.publisher(for: Notification.Name("vkTokenSaved"))
    @State var isAuthorized: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isAuthorized {
                ContainerView()
            } else {
                VKLoginWebView().onReceive(VKAppSwiftUIApp.tokenSavedPublisher) { _ in
                    self.isAuthorized.toggle()
                }
            }
        }
    }
}
