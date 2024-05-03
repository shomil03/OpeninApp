//
//  LinkView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import SwiftUI

struct RecentLinkView: View {
    var response : Response
    let limit : Int
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0..<limit , id: \.self){number in
                    
                    VStack{
                        RecentListView(link: response.data.recent_links[number])
                    }
                    .padding()
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    RecentLinkView(response: MockDataObject.sampleResponse , limit: 1)
}
