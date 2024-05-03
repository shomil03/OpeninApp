//
//  ListView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import SwiftUI

struct RecentListView: View {
//    let url : String
    let link : RecentLink
    
    var body: some View {
        let lightBlue = Color(red: 173/255, green: 216/255, blue: 230)
        VStack {
            HStack{
                ImageView(imageLink: link.original_image)
                    .frame(width: 100, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.leading)
                VStack{
                    HStack{
                        Text("\(link.title)")
                            .foregroundStyle(.black)
                            .frame(width: 120 , height: 20)
                        Spacer()
                        Text("\(link.total_clicks)")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
//                            .padding(.trailing)
                        
                    }
                    
                    HStack{
                        Text("\(link.created_at)")
                            .foregroundStyle(.black)
                            .opacity(0.5)
                            .font(.caption)
                            .frame(width: 120 , height: 20)
                            
                        Spacer()
                        Text("Clicks")
                            .foregroundStyle(.black)
                            .opacity(0.5)
                            .font(.caption)
//                            .padding(.trailing)
                        
                    }
                }
                
                Spacer()
            }
            HStack(){
                Text("\(link.web_link)")
                    .foregroundStyle(Color.blue)
                    .padding(.leading)
                Spacer()
            }
            .frame(height: 50)
            .overlay(
                Rectangle()
                    .strokeBorder(.blue ,  style: StrokeStyle(lineWidth: 2 , dash: [10]))
            )
            .background(Color(lightBlue))
            
        }
        .background(Color(red: 250/255, green: 250/255, blue: 250/255))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

#Preview {
    RecentListView(link: MockDataObject.sampleResponse.data.recent_links[0])
}
