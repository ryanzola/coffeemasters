//
//  MenuPage.swift
//  CoffeeMasters
//
//  Created by Ryan Zola on 8/6/22.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    @State var search = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuManager.menu) { category in
                    if category.filteredItems(text: search).count > 0 {
                        Text(category.name)
                            .font(.title2)
                            .bold()
                            .listRowBackground(Color("Background"))
                            .foregroundColor(Color("Secondary"))
                            .padding(.top)
                    }
                    
                    ForEach(category.filteredItems(text: search)) { item in
                        ZStack {
                            NavigationLink(destination: DetailsPage(product: item)) {
                                EmptyView()
                            }
                            ProductItem(product: item)
                                
                                

                        }
                        
                    }
                }
            }
            .navigationTitle("Products")
            .searchable(text: $search)
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
            .environmentObject(MenuManager())
            .environmentObject(LikesManager())
    }
}
