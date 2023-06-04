//
//  NetworkClient.swift
//  SwiftUI-MVVM-C
//
//  Created by Nguyen Cong Huy on 5/17/21.
//

import Foundation

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

class NetworkManager {
    func fetch<T: Codable>(url: String, expecting: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
