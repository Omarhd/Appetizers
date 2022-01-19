//
//  Appetizer.swift
//  Appetizers
//
//  Created by Omar Abdulrahman on 1/18/22.
//

import Foundation

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "Stick",
                                           description: "Stick meal is such an amazing mel to eat at morinig",
                                           price: 22.3,
                                           imageURL: "",
                                           calories: 22,
                                           protein: 32,
                                           carbs: 12)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
