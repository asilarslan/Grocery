//
//  Constant.swift
//  Grocery
//
//  Created by Asil Arslan on 7.05.2021.
//

import SwiftUI

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 4)
}
