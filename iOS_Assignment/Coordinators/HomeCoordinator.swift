//
//  HomeCoordinator.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import Foundation
import UIKit

class HomeCoordinator {

    private let navController: UINavigationController
    private let networkManager: NetWorkManager

    init(navController: UINavigationController, networkManager: NetWorkManager) {
        self.navController = navController
        self.networkManager = networkManager
    }

    func showProductDetails(id: Int) {
        let coordinator = ProductCoordinator(navigationControler: navController, networkManager: networkManager)
        coordinator.showProductDetails(id: id, coordinator: self)
    }

    func backToHomeView() {
        let coordinator = ProductCoordinator(navigationControler: navController, networkManager: networkManager)
        coordinator.backToHomeViewController()
    }
}
