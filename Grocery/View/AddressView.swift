//
//  AddressView.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI

struct AddressView: View {
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "house")
                    .font(.title2)
                    .padding(.leading, 10)
                    .foregroundColor(Color("ColorBlack"))
                Divider()
                    .padding(.vertical, 10)
                Text("Home")
                    .foregroundColor(Color("ColorBlack"))
                Text("Bereketzade, Galata Kulesi, 34421 Beyoğlu/İstanbul")
                    .lineLimit(1)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.forward")
                    .foregroundColor(Color("ColorPrimary"))
                    .padding(.trailing, 10)
            }.background(
                Color("ColorWhite")
                    .clipShape(CustomShape())
            )
            Spacer()
            VStack {
                Text("ETA")
                    .font(.caption)
                (
                    Text("10-25")
                        .font(.footnote)
                    +
                    Text("min")
                        .font(.caption)
                )
                .fontWeight(.semibold)
            }
            .padding(.trailing, 10)
            
        }
        .frame(height: 50)
        .background(Color.yellow)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView()
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


