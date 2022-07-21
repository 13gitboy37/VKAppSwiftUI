//
//  NavigationController.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 20.07.2022.
//

import SwiftUI

struct NavigationController: UIViewControllerRepresentable {
//
//    @Binding var pushedViewController: View
    
    public let navController =  UINavigationController()


    func makeUIViewController(context: Context) -> UINavigationController {
        navController.setNavigationBarHidden(true, animated: false)
        let viewController = UIViewController()
        navController.addChild(viewController)
        return navController
    }

    func updateUIViewController(_ navViewController: UINavigationController, context: Context) {
//        navViewController.pushViewController(pushedViewController, animated: true)
    }

func makeCoordinator() -> Coordinator {
    return Coordinator(self)
}

class Coordinator: NSObject {
    var parent: NavigationController

    init(_ loginViewController: NavigationController) {
        self.parent = loginViewController
    }
}

//    func pushViewController(_ view: UIView) {
//        self.pushViewController(view)
//    }
//func authenticate() {
//    let app = UIApplication.shared.delegate as! AppDelegate
//    let userData = app.userData
//
//    userData.authenticateWithDropinUI(navigationController: navController)
//   
}
