//
//  ViewAllLink.swift
//  OpeninApp
//
//  Created by Shomil Singh on 04/05/24.
//

import SwiftUI

struct ViewAllLink: View {
    let response : Response
    var body: some View {
        ScrollView{
            TopLinkView(response: response, limit: response.data.top_links.count)
            RecentLinkView(response: response, limit: response.data.recent_links.count)
        }
        .navigationTitle("All Links")
        
    }
}

#Preview {
    ViewAllLink(response: MockDataObject.emptyResponse)
}
