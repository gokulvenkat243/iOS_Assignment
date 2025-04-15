//
//  RootTabBarView.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation
import UIKit

final class TabBarCoordinator {

    private let navController: UINavigationController
    private let tabBarController: UITabBarController
    private let networkManager = NetWorkManager()

    init(navController: UINavigationController) {
        self.navController = navController
        self.tabBarController = UITabBarController()
    }

    func start() {
        let repository = DefaultProductRepository(networkManager: networkManager)

        let homeCoordinator = HomeCoordinator(navController: navController, networkManager: networkManager)
        let viewModel = DefaultHomeViewModel(repository: repository, coordinator: homeCoordinator)
        let homeVC = HomeViewController(viewModel: viewModel)
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))

        let cartViewModel = CartViewModel()
        let catalogVC = ProductDetailViewController(viewModel: viewModel, cartViewModel: cartViewModel)
        catalogVC.tabBarItem = UITabBarItem(title: "Catalog",
                                            image: UIImage(systemName: "magnifyingglass"),
                                            selectedImage: UIImage(systemName: "magnifyingglass"))

        let cartVC = CartViewController(homeViewModel: viewModel, cartViewModel: cartViewModel)
        cartVC.tabBarItem = UITabBarItem(title: "Cart",
                                         image: UIImage(systemName: "cart"),
                                         selectedImage: UIImage(systemName: "cart.fill"))

        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites",
                                              image: UIImage(systemName: "heart"),
                                              selectedImage: UIImage(systemName: "heart.fill"))

        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person.circle"),
                                            selectedImage: UIImage(systemName: "person.circle.fill"))

        tabBarController.viewControllers = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: catalogVC),
            UINavigationController(rootViewController: cartVC),
            UINavigationController(rootViewController: favoritesVC),
            UINavigationController(rootViewController: profileVC)
        ]

        tabBarController.tabBar.tintColor = UIColor.colorWithHexString(hexString: "#CCDA46")
        tabBarController.tabBar.unselectedItemTintColor = UIColor.gray

        navController.setViewControllers([tabBarController], animated: false)
    }
}
