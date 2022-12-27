//
//  TrainingModel.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 31.10.2022.
//

import Foundation

struct TrainingModel {
    var lessonLength: TimeInterval
    var calories: Int
    var complexity: Int
    var trainingName: String
    var imageName: String
    var isFavourite: Bool
    var description: String
    var equipment: [String]
}

extension TrainingModel {
    static var mockWorkouts: [TrainingModel] = [
        .init(
            lessonLength: 50 * 60,
            calories: 365,
            complexity: 4,
            trainingName: "Full body",
            imageName: "fullBody",
            isFavourite: false,
            description: "Workout for muscle growth and strength regardless of your training experience. Optimize your training frequency and recovery throughout the week.",
            equipment: ["dumbbells", "resistance bands"]),
        .init(
            lessonLength: 20 * 60,
            calories: 310,
            complexity: 3,
            trainingName: "Barre",
            imageName: "barre",
            isFavourite: true,
            description: "",
            equipment: ["dumbbells", "resistance bands"]),
        .init(
            lessonLength: 45 * 60,
            calories: 413,
            complexity: 5,
            trainingName: "Hiit",
            imageName: "hiit",
            isFavourite: false,
            description: "",
            equipment: ["dumbbells", "resistance bands"]),
        .init(
            lessonLength: 30 *  60,
            calories: 300,
            complexity: 2,
            trainingName: "Abs burn",
            imageName: "abs",
            isFavourite: false,
            description: "",
            equipment: ["dumbbells", "resistance bands"])
    ]
    
    static var defaultModel = TrainingModel(
        lessonLength: TimeInterval(60 * 50),
        calories: 365,
        complexity: 4,
        trainingName: "FULL BODY",
        imageName: "training",
        isFavourite: false,
        description: "Workout for muscle growth and strength regardless of your training experience. Optimize your training frequency and recovery throughout the week.",
        equipment: ["dumbbells", "resistance bands"]
    )
    
    var lengthDescription: String {
        let interval = lessonLength
        let minutes = Int((interval / 60).truncatingRemainder(dividingBy: 60))
        let hours = Int(interval / 3600)
        var output = ""
        if hours > 0 {
            output = "\(hours) h "
        }
        if minutes > 0 {
            output += "\(minutes) min"
        }
        return output
    }
    
    var caloriesDescription: String {
        return "\(calories) kkal"
    }
}
