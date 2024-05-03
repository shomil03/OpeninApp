//
//  TopLinkView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import SwiftUI

struct TopLinkView: View {
    let response : Response
    let limit : Int
    var body: some View {
//        ScrollView{
            LazyVStack{
                ForEach(0..<limit , id: \.self){number in
                    
                    VStack{
                        TopListView(link: response.data.top_links[number])
                    }
//                    .padding(.bottom , 5)
                    .padding()
                }
            }
//        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TopLinkView(response: MockDataObject.sampleResponse, limit: 1)
}
