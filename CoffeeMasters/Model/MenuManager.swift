//
//  MenuManager.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 8/7/22.
//

import Foundation
import Alamofire

class MenuManager: ObservableObject {
    @Published var menu: [Category] = [
        Category(name: "HOT COFFEE", products: [
            Product(id: 0, name: "", description: "", price: 1.25, image: ""),
            Product(id: 1, name: "", description: "", price: 1.25, image: ""),
            Product(id: 2, name: "", description: "", price: 1.25, image: ""),
            Product(id: 0, name: "", description: "", price: 1.25, image: ""),
            Product(id: 0, name: "", description: "", price: 1.25, image: "")
        ])
    ]
    
    init() {
        refreshItemsFromNetwork()
    }
    
    func refreshItemsFromNetwork() {
        AF.request("https://firtman.github.io/coffeemasters/api/menu.json")
            .responseDecodable(of: [Category].self) { response in
                if let menuFromNetwork = response.value {
                    self.menu = menuFromNetwork
                }
            }
    }
}
