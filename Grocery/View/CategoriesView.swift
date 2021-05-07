//
//  CategoriesView.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI

struct CategoriesView: View {
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing:15,  content: {
          
            ForEach(categories) { item in
                CategoryItemView(image: item.image, name: item.name)
            }
        })
    }
}

// MARK: - PREVIEW

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
