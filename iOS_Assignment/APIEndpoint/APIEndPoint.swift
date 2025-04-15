//
//  APIEndPoint.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation

struct APIEndPoint {
    static let baseUrl = "https://fakestoreapi.com"

    static func getProduct() -> String {
        return "\(baseUrl)/products"
    }

    static func getProductDetails(id: Int) -> String {
        return "\(baseUrl)/products/\(id)"
    }
}
