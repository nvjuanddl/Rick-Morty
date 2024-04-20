//
//  AppDelegate.swift
//  Rick&Morty
//
//  Created by Juan Delgado Lasso on 20/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        let navigationController = HostingNavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return true
    }
}
