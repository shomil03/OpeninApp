//
//  CardView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 03/05/24.
//

import SwiftUI

struct CardView: View {
    let image : String
    let heading : String
    let subHeading : String
    var body: some View {
        VStack(alignment: .leading){
            Image(systemName: image)
                .font(.system(size: 50))
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color.blue)
                .padding()
//                .padding(.bottom , 3)
            
            Text(heading.count == 0 ? "NA" : "\(heading)")
                .font(.title)
                .foregroundStyle(Color.black)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            Text(subHeading.count == 0 ? "NA" : "\(subHeading)")
                .font(.title3)
                .foregroundStyle(Color.black)
                .opacity(0.5)
                .padding(.bottom)
//                .padding(.top ,1)
                .padding(.horizontal)
            
        }
        
        .frame(width: 150 , height: 170)
        .background(Color(red: 250/255, green: 250/255, blue: 250/255))
        .padding(.horizontal , 10)
    }
}

#Preview {
    CardView(image: "mappin.and.ellipse.circle.fill", heading: "123", subHeading: "Today's click")
}
