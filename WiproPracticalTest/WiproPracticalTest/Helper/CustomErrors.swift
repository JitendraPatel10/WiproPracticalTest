//
//  CustomErrors.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation

enum CustomError: Error {
    case invalidURL
    case invalidResponse
    case inValidResponseData
    case error(_ error: String?)
}

extension CustomError {
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Provided URL is invalid."
        case .invalidResponse:
            return "Something! please try again later."
        case .inValidResponseData:
            return "Invalid data provide from server."
        case .error(let strError):
            return strError ?? CustomError.invalidResponse.description
        }
    }
}
