//
//  BackButton.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 25.11.2022.
//

import Foundation
import SwiftUI

struct BackButton: View {
    
    let size: CGFloat
    
    var body: some View {
        Image(systemName: "arrow.left")
            .colorMultiply(.white)
            .frame(width: size, height: size)
            .background(Constants.BackButton.backColor)
            .foregroundColor(.white)
            .cornerRadius(size / 2)
            .shadow(radius: Constants.HeartView.shadowRadius, x: Constants.HeartView.shadowX)
    }
}
