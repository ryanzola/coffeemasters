//
//  Offer.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 7/31/22.
//

import SwiftUI

struct Offer: View {
    var title = ""
    var description = ""
    
    var body: some View {
        VStack {
            Text(title)
                .padding()
                .font(.title)
                .background(Color("CardBackground"))
            Text(description)
                .padding()
                .background(Color("CardBackground"))
        }
    }
}

struct Offer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Offer(title: "My offer", description: "My description")
                .previewLayout(.fixed(width: 350, height: 200))
                .preferredColorScheme(.light)
        }
    }
}
