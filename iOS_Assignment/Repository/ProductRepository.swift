//
//  ProductRepository.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation

protocol ProductRepository {
    func fetchProduct(completion: @escaping (Result<[ProductData], Error>) -> Void)
    func fetchProductDetails(id: Int, completion: @escaping (Result<ProductData, Error>) -> Void)
}

class DefaultProductRepository: ProductRepository {

    private let networkManager: NetWorkManager

    init(networkManager: NetWorkManager) {
        self.networkManager = networkManager
    }

    func fetchProduct(completion: @escaping (Result<[ProductData], Error>) -> Void) {
        let urlPath = APIEndPoint.getProduct()

        networkManager.request(urlPath: urlPath) { (result: Result<[ApiProductModel], Error>) in
            switch result {
            case .success(let data):
                let data = data.map { $0.toProductData() }
                completion(.success(data))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchProductDetails(id: Int, completion: @escaping (Result<ProductData, Error>) -> Void) {
        let urlPath = APIEndPoint.getProductDetails(id: id)

        networkManager.request(urlPath: urlPath) { (result: Result<ApiProductModel, Error>) in
            switch result {
            case .success(let data):
                let data = data.toProductData()
                completion(.success(data))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension ApiRatingModel {
    func toRatingData() -> RatingData {
        return RatingData(rate: rate, count: count)
    }
}

extension ApiProductModel {

    func toProductData() -> ProductData {
        return ProductData(id: id, title: title, price: price, description: description, category: category, image: image, rating: rating.toRatingData())
    }
}
