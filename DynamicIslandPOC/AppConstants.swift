//
//  AppConstants.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 25.11.2022.
//

import Foundation
import SwiftUI

enum Constants {
    enum Global {
        enum Colors {
            static let accent = Color(red: 165 / 255, green: 254 / 255, blue: 76 / 255)
            static let accentPink = Color(red: 255 / 255, green: 66 / 255, blue: 134 / 255)
            static let background = Color(red: 45 / 255, green: 51 / 255, blue: 57 / 255)
            static let backgroundDark = Color(red: 28 / 255, green: 28 / 255, blue: 28 / 255)
        }
    }
    
    enum CounterView {
        static let backgroundColor = Constants.Global.Colors.accentPink
        static let goColor = Constants.Global.Colors.accent
        
        static let amountOfNumbers = 3
        static let numberMaxSize = CGFloat(128)
        static let goMaxSize = CGFloat(200)
        
        static let goText = "GO!"
        
        static let showHideAnimation: Animation = .easeIn(duration: Constants.CounterView.showHideAnimationDuration)
        static let showHideAnimationDuration = CGFloat(0.4)
        static let showHideAnimationDurationWithDelay = CGFloat(0.5)
        static let pauseDuration = CGFloat(0.2)
        static let counterAnimationDuration = CGFloat(0.3)
        static let counterAnimationHalfDuration = Constants.CounterView.counterAnimationDuration + Constants.CounterView.pauseDuration
        static let counterAnimationFullDuration = 2 * Constants.CounterView.counterAnimationDuration + Constants.CounterView.pauseDuration
        static let blackoutAnimationDuration = CGFloat(0.2)
        static let goAnimationDuration = CGFloat(0.7)
        
        static let counterAnimation: Animation = .easeIn(duration: Constants.CounterView.counterAnimationDuration)
        static let blackoutAnimation: Animation = .easeIn(duration: Constants.CounterView.blackoutAnimationDuration)
        static let goAnimation: Animation = .easeIn(duration: Constants.CounterView.goAnimationDuration)
        
        static let whenToGoNext =
        Constants.CounterView.goAnimationDuration +
        Constants.CounterView.counterAnimationFullDuration * CGFloat(Constants.CounterView.amountOfNumbers)
        + Constants.CounterView.blackoutAnimationDuration
    }
    
    enum FitnessList {
        static let text1stLine = "CHOOSE"
        static let text2ndLine = "YOUR"
        static let text3rdLine = "WORKOUT"
        
        static let backgroundColor = Constants.Global.Colors.accentPink
        static let textColor = Constants.Global.Colors.accent
        
        static let rowBackground = Constants.Global.Colors.backgroundDark
        static let rowPressedOverlayOpacity = CGFloat(0.3)
        static let rowScale = CGFloat(0.95)
        static let rowHeight = CGFloat(152)
        static let showDelay = CGFloat(0.3)
        static let showHideAnimationDuration = CGFloat(0.3)
        static let showHideAnimation: Animation = .easeIn(duration: Constants.FitnessList.showHideAnimationDuration)
    }
    
    enum DetailView {
        static let cardBackgroundColor = Constants.Global.Colors.backgroundDark
        
        static let goNextDelay = CGFloat(1.5)
        static let delayBeforeNewSlide = CGFloat(0.5)
        static let hideAnimationDuration = CGFloat(0.4)
        static let showHideAnimation: Animation = .timingCurve(0.99, 0, 1, 0.99, duration: Constants.DetailView.hideAnimationDuration)
        
        static let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "background-video", ofType:"mp4")!)
    }
    
    enum TrainingPlayerView {
        static let showAnimationDuration = CGFloat(0.25)
        static let showAnimation: Animation = .easeIn(duration: Constants.TrainingPlayerView.showAnimationDuration)
        
        static let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "background-training", ofType:"mp4")!)
    }
    
    enum HeartView {
        static let heartPressedColor = Constants.Global.Colors.accent
        static let shadowX = CGFloat(2)
        static let shadowRadius = CGFloat(18)
    }
    
    enum BackButton {
        static let backColor = Color(red: 34 / 255, green: 34 / 255, blue: 34 / 255, opacity: 0.4)
    }
    
    enum ComplexityView {
        static let numberOfIcons = 5
    }
    
    enum Slider {
        static let sliderBackgroundColor = Color(red: 10 / 255, green: 10 / 255, blue: 10 / 255)
        static let sliderForegroundColor = Constants.Global.Colors.accent
        
        static let bounceBackAnimationDuration = CGFloat(0.3)
        static let bounceBackAnimation: Animation =
            .easeOut(duration: Constants.Slider.bounceBackAnimationDuration)
        
        static let dragEndedAnimationDuration = CGFloat(0.12)
        static let dragEndedAnimationDelay = CGFloat(0.1)
        static let dragEndedAnimation: Animation =
            .easeOut(duration: Constants.Slider.dragEndedAnimationDuration)
            .delay(Constants.Slider.dragEndedAnimationDelay)
        
        static let thumbTextFadeDistance = CGFloat(20)
        static let thumbWidth = CGFloat(128)
        static let thumbHeight = CGFloat(60)
        static let thumbText = "Go!"
        static let finalText = "Get ready to feel the burn"
        static let startText = "Slide to start"
        
        enum Arrows {
            static let arrowCount = 3
            static let arrowSize = CGSize(width: 5, height: 10)
            static let animationDuration = CGFloat(0.4)
            static let animationDelay = CGFloat(0.1)
            static let fadeInitial = CGFloat(0.5)
            static let fadeFinal = CGFloat(1)
            static let scaleInitial = CGFloat(1)
            static let scaleFinal = CGFloat(1.2)
            static let repeatInterval = CGFloat(1.5)
        }
    }
    
    enum DynamicIsland {
        static let startButtonName = "Start"
        static let changeButtonName = "Change"
        
        static let startButtonColor = Constants.Global.Colors.accent
        static let changeButtonColor = Constants.Global.Colors.background
        
        static let buttonHeight: CGFloat = 45
    }
}
