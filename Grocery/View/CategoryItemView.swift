//
//  CategoryItemView.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI

struct CategoryItemView: View {
    
    var image: String
    var name: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .padding()
                .background(Color("ColorWhite"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.35), radius: 2)
            Text(name)
                .font(.caption)
                .foregroundColor(Color("ColorBlack"))
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(image: "category-1", name: "Special Offers")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
