//
//  AppDelegate.swift
//  CleanApp
//
//  Created by Oscar De Moya on 5/10/22.
//

import UIKit

let appDelegate: AppDelegate = {
    guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
        preconditionFailure("Missing AppDelegate")
    }
    return delegate
}()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}
