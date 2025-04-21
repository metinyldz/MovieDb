//
//  BaseViewModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 18.12.2022.
//

import Foundation

class BaseViewModel: ObservableObject {
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            case .invalidStatusCode:
                return "Request doesn't fall in the valid status code"
            }
        }
    }
}
