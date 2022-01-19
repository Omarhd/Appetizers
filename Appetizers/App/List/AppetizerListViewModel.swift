//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Omar Abdulrahman on 1/19/22.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkServices.shared.getAppetizers { Result in
            switch Result {
                
            case .success(let appetizers):
                self.appetizers = appetizers
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
