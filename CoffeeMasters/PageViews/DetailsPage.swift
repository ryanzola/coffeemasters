//
//  DetailsPage.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 8/6/22.
//

import SwiftUI

struct DetailsPage: View {
    @EnvironmentObject var cartManager: CartManager
    @State var quantity = 1
    var product: Product
    
    var body: some View {
        ScrollView {
            AsyncImage(url: product.imageURL)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                .padding(.top, 32)
            
            VStack {
                Text(product.name)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    
                    .padding(24)
                    
                
                Text(product.description)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(24)
                    
                    .foregroundColor(Color("Primary"))
            }
            
            HStack {
                Text("\(product.price, specifier: "%.2f")ea")
                Stepper(value: $quantity, in: 1...10) { }
            }
            .frame(maxWidth: .infinity)
            .padding(30)
            
            Text("Subtotal $\(Double(quantity) * product.price, specifier: "%.2f")")
                .bold()
                .padding(12)
            
            Button("Add \(quantity) to cart") {
                cartManager.add(product: product, quantity: quantity)
            }
            .padding()
            .frame(width: 250.0)
            .background(Color("Alternative2"))
            .foregroundColor(Color.black)
            .cornerRadius(25)
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(product: Product(id: 1, name: "Dummy Product", description: "A yummy little coffee drink to prevent me from killing myself", price: 1.25, image: "blackamericano.png"))
            .environmentObject(CartManager())
    }
}
