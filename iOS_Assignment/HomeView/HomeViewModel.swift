//
//  HomeViewModel.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation

protocol HomeViewModel {
    func getProductData(index: Int) -> ProductData
    func fetchHomeData()
    func numberOfItems() -> Int
    var updateProductData: (() -> Void)? { get set }
    var updateProductDetailsData: ((ProductData) -> Void)? { get set }
    func getProductDetails(id: Int)
    var productDetailsData: ProductData? { get set }
    func backToHomeView()
    func showProductDetails(id: Int)
}

class DefaultHomeViewModel: HomeViewModel {

    let repository: ProductRepository
    private var productsData: [ProductData] = []
    var productDetailsData: ProductData?
    var error: ((String) -> Void)?
    var updateProductData: (() -> Void)?
    var updateProductDetailsData: ((ProductData) -> Void)?
    private var coordinator: HomeCoordinator

    init(repository: ProductRepository, coordinator: HomeCoordinator) {
        self.repository = repository
        self.coordinator = coordinator
    }

    func numberOfItems() -> Int {
        return productsData.count
    }

    func getProductData(index: Int) -> ProductData {
        return productsData[index]
    }

    func fetchHomeData() {
        repository.fetchProduct { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case.success(let data):
                    self.productsData = data
                    self.updateProductData?()
                case.failure(let error):
                    self.error?(error.localizedDescription)
                }
            }
        }
    }

    func getProductDetails(id: Int) {
        repository.fetchProductDetails(id: id) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.productDetailsData = data
                    self.updateProductDetailsData?(data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    func showProductDetails(id: Int) {
        self.coordinator.showProductDetails(id: id)
    }

    func backToHomeView() {
        self.coordinator.backToHomeView()
    }
}
