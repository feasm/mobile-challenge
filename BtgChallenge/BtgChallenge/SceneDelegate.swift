//
//  SceneDelegate.swift
//  BtgChallenge
//
//  Created by Felipe Alexander Silva Melo on 10/05/20.
//  Copyright © 2020 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

// swiftlint:disable line_length
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator(window: window!) // swiftlint:disable:this force_unwrapping
        appCoordinator?.start()
    }

}
