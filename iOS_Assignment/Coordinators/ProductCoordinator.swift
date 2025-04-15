//
//  ProductCoordinator.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import Foundation
import UIKit

class ProductCoordinator {

    private let navigationControler: UINavigationController
    private let networkManager: NetWorkManager

    init(navigationControler: UINavigationController, networkManager: NetWorkManager) {
        self.navigationControler = navigationControler
        self.networkManager = networkManager
    }

    func showProductDetails(id: Int, coordinator: HomeCoordinator) {
        let repository = DefaultProductRepository(networkManager: networkManager)
        let viewModel = DefaultHomeViewModel(repository: repository, coordinator: coordinator)
        let cartViewModel =  CartViewModel()
        let vc = ProductDetailViewController(viewModel: viewModel, cartViewModel: cartViewModel)
        navigationControler.pushViewController(vc, animated: true)
        viewModel.getProductDetails(id: id)
    }

    func backToHomeViewController() {
        navigationControler.popViewController(animated: true)
    }
}
