//
//  ProductItem.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 8/6/22.
//

import SwiftUI

struct ProductItem: View {
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: product.imageURL)
                .scaledToFit()
                .frame(width: 300, height: 150)
   
            HStack {
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.title3)
                        .bold()
                    Text("$\(product.price, specifier: "%.2f")")
                        .font(.caption)
                }
                Spacer()
                LikeButton(product: product)
            }.padding(8)
        }
        .cornerRadius(10)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: Product(id: 1, name: "Dummy Product", description: "", price: 4.25, image: "blackamericano.png"))
            .environmentObject(LikesManager()).padding()
    }
}
