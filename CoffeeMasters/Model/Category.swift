//
//  Category.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 8/6/22.
//

import Foundation

struct Category: Decodable, Identifiable {
    var id: String { name }
    var name: String
    var products: [Product]

    func filteredItems(text: String) -> [Product] {
        if text.count > 0 {
            return products.filter({ item in
                item.name.contains(text)
            })
        } else {
            return products
        }
    }
}
