//
//  HeartView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 21.11.2022.
//

import Foundation
import SwiftUI

enum HeartSize: CGFloat {
    case small = 24
    case big = 48
}

struct HeartImage: View {
    let pressed: Bool
    let size: HeartSize
    
    var body: some View {
        if pressed {
            Image(size == .big ? "heart" : "heart-small")
                .colorMultiply(.black)
                .frame(width: size.rawValue, height: size.rawValue)
                .background(Constants.HeartView.heartPressedColor)
                .cornerRadius(size.rawValue / 2)
            
        } else {
            Image(size == .big ? "heart" : "heart-small")
                .frame(width: size.rawValue, height: size.rawValue)
                .background(.white)
                .cornerRadius(size.rawValue / 2)
        }
    }
}
