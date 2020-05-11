//
//  AppCoordinator.swift
//  BtgChallenge
//
//  Created by Felipe Alexander Silva Melo on 10/05/20.
//  Copyright © 2020 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = CoinConvertViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = UIColor.darkBlue
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.isTranslucent = false
        if let font = UIFont.btgLabelSmall() {
            navigationController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: font
            ]
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}