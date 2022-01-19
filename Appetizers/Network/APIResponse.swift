//
//  APIResponse.swift
//  Forgan
//
//  Created by Omar on 26/11/2021.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case data = "request"
    }
}
