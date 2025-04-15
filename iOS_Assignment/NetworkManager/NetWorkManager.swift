//
//  NetWorkManager.swift
//  iOS_Assignment
//
//  Created by gokul v on 14/04/25.
//

import Foundation

class NetWorkManager {

    func request<T: Decodable>(urlPath: String, comletion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlPath) else { return }

        var request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return
            }
            guard let data = data else {
                return
            }

            do {
                let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                comletion(.success(jsonResponse))
            } catch {
                comletion(.failure(error))
            }
        }
        return task.resume()
    }
}
