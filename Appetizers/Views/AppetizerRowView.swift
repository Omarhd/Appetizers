//
//  AppetizerRowView.swift
//  Appetizers
//
//  Created by Omar Abdulrahman on 1/18/22.
//

import SwiftUI

struct AppetizerRowView: View {
   
    // MARK: - PROPERTIES
    var appetizer: Appetizer
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image("lemon")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 10))
           
            VStack(alignment: .leading, spacing: 8) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Text(appetizer.description)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}
// MARK: - PRVIEW
struct AppetizerRowView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerRowView(appetizer: MockData.sampleAppetizer)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
