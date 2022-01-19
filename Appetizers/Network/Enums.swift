//
//  Enums.swift
//  Forgan
//
//  Created by Omar on 26/11/2021.
//

import Foundation

enum Route {
    
    static let baseUrl = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"

    case appetizers
    
    var description: String {
        
        switch self {       
        case .appetizers: return "appetizers"
        }
    }
}

enum Method: String {
   
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"

}

enum AppError: LocalizedError {
    
    case errorDecoding
    case unknownError
    case invalidUrl
    case responseError(String)
    case serverError(Bool)
    
    var errorDescription: String? {
       
        switch self {
        
        case .errorDecoding:
            return "Response can't be decoded"
        case .unknownError:
            return "unknown Error"
        case .invalidUrl:
            return "invalid url"
        case .responseError:
            return "Error"
            
        case .serverError(let error):
            switch error {
           
            case true:
                return "true"
            case false:
                return "false"
            }
        }
    }
}
