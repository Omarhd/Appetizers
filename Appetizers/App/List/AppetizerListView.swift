//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Omar Abdulrahman on 1/18/22.
//

import SwiftUI

struct AppetizerListView: View {
 
    // MARK: - PROPERTIES
    @StateObject private var viewModel = AppetizerListViewModel()
    @State private var isShowingWishList: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach (viewModel.appetizers) { appetizer in
                    AppetizerRowView(appetizer: appetizer)
                }
            }
            .navigationTitle("Appetizers")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingWishList = true
                    }) {
                        Image(systemName: "heart.fill")
                            .accentColor(Color.red)
                    } // : BUTTON
                    .sheet(isPresented: $isShowingWishList) {
                        WishListView()
                    }
            )
        }
        .onAppear {
            viewModel.getAppetizers()
        }
    }
}

// MARK: - PREVIEW
struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
