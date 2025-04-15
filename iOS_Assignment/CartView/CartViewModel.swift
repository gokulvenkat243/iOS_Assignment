//
//  CartViewModel.swift
//  iOS_Assignment
//
//  Created by gokul v on 15/04/25.
//

import Foundation

class CartViewModel {
    private(set) var productsInCart: [ProductData] = []

    func addToCart(_ product: ProductData) {
        productsInCart.append(product)
        print(getCartItem())
    }

    func removeFromCart(_ product: ProductData) {
        productsInCart.removeAll { $0.id == product.id }
    }

    func isInCart(_ product: ProductData) -> Bool {
        return productsInCart.contains { $0.id == product.id }
    }

    func cartCount() -> Int {
        return productsInCart.count
    }

    func getCartItem() -> [ProductData] {
        return productsInCart
    }
}
