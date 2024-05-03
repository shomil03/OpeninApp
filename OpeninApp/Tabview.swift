//
//  TabView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 01/05/24.
//

import SwiftUI

struct Tabview: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView {
            ContentView(response: MockDataObject.sampleResponse , linkDetails: [])
//            ContentView()
                .tabItem {
                    Label("Links", systemImage: "link")
                }
            CoursesView()
                .tabItem {
                    Label("Courses" , systemImage: "book")
                }
            AddView()
                .tabItem {
                    Image(systemName: "plus.circle")
                }
            CampainsView()
                .tabItem {
                    Label("Campaigns", systemImage: "megaphone")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            
            
        }
        .tint(.black)
        
        
        
    }
}

#Preview {
    Tabview()
}
