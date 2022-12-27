//
//  ComplexityView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 31.10.2022.
//

import Foundation
import SwiftUI

struct ComplexityView: View {
    let complexity: Int
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<Constants.ComplexityView.numberOfIcons) { i in
                if i < complexity {
                    Image("calory")
                }
                else {
                    Image("calory-grey")
                }
            }
        }
    }
}
