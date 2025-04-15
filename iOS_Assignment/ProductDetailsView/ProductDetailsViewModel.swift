//
//  ProductDetailsViewModel.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation

protocol ProductDetailsViewModel {
    func getProductDetails(id: Int)
}

class DefaultProductDetailsViewModel: ProductDetailsViewModel {
    private let repository: ProductRepository
    private var productDetailsData: [ProductData] = []

    init(repository: ProductRepository) {
        self.repository = repository
    }

    func getProductDetails(id: Int) {
      
    }
}
