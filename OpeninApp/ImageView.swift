//
//  ImageView.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import SwiftUI

struct ImageView: View {
    let imageLink : String
    var body: some View {
        AsyncImage(url: URL(string: imageLink) , transaction: .init(animation: .bouncy(duration: 1.0))) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFit()// Displays the loaded image.
            } else if phase.error != nil {
                Color.red // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder.
            }
        }
//        .frame(width: 25 , height: 25)
    }
}

#Preview {
    ImageView(imageLink: "data:image/jpeg;base64,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")
}
