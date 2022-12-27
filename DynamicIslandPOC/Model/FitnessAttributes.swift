//
//  ActivityAttributes.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 22.10.2022.
//

import Foundation
import ActivityKit

struct FitnessAttributes: ActivityAttributes {
    
    public struct ContentState: Codable, Hashable {
        // no state
    }
    
    var lessonLength: String
    var calories: String
    var complexity: Int
    var trainingName: String
    var imageName: String
}
