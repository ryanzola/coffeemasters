//
//  LikeButton.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 8/7/22.
//

import SwiftUI

struct LikeButton: View {
    @EnvironmentObject var likesManager: LikesManager
    var product: Product
    
    var body: some View {
        Image(systemName: likesManager.isLiked(id: product.id) ? "heart.fill" : "heart")
            .padding()
            .font(.title2)
            .foregroundColor(Color.red)
            .accessibilityLabel(likesManager.isLiked(id: product.id) ? "Dislike" : "Like")
            .onTapGesture {
                likesManager.toggle(product.id)
            }
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(product: Product(id: 1, name: "Dummy", description: "Tasty", price: 1.5, image: ""))
            .environmentObject(LikesManager())
    }
}
