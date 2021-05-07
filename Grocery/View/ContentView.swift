//
//  ContentView.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationView()
            AddressView()
            ScrollView(.vertical, showsIndicators: false, content: {
                MapView()
                    .frame(height: getRect().height / 4)
                CategoriesView()
                    .padding(10)
            })
        }
        .background(Color("ColorWhite").ignoresSafeArea())
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
