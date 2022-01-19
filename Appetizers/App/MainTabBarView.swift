//
//  ContentView.swift
//  Appetizers
//
//  Created by Omar Abdulrahman on 1/18/22.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orders")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                }
        }
        .accentColor(Color("PrimaryColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
            .preferredColorScheme(.dark)
    }
}
