//
//  HomeModel.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation

struct ProductData: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: RatingData
}

struct RatingData: Codable {
    let rate: Double
    let count: Int
}

struct ApiProductModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: ApiRatingModel
}

struct ApiRatingModel: Codable {
    let rate: Double
    let count: Int
}


