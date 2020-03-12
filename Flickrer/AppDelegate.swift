//
//  AppDelegate.swift
//  Flickrer
//
//  Created by crypto_user on 12.03.2020.
//  Copyright © 2020 voidilov. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureKingfisher()
        return true
    }

    private func configureKingfisher() {
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 200 * 1024 * 1024
        KingfisherManager.shared.cache.diskStorage.config.sizeLimit = 400 * 1024 * 1024
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

}
