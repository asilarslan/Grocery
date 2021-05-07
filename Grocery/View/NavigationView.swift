//
//  NavigationView.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HStack{
            Text("Grocery App")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
        .frame(width: getRect().width, height: 45.0 + CGFloat(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0))
        .background(Color("ColorPrimary"))
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}

