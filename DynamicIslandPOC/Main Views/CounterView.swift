//
//  CounterView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 23.11.2022.
//

import Foundation
import SwiftUI

struct CounterView: View {
    @State var sizes: [CGFloat] = Array.init(repeating: 0, count: Constants.CounterView.amountOfNumbers)
    @State var positions: [CGFloat] = Array.init(repeating: -120, count: Constants.CounterView.amountOfNumbers)
    @State var color = Constants.CounterView.backgroundColor
    @State var goOpacity: CGFloat = 1
    @State var goSize: CGFloat = 0
    @State var showGo = false
    
    @State var showView = true
    @State var showTrainingView = false
    
    var body: some View {
        ZStack {
            if showTrainingView {
                TrainingPlayerView()
            }
            if showView {
                color
                    .ignoresSafeArea(.all) // Ignore just for the color
                    .overlay(
                        GeometryReader { gr in
                            let height = gr.size.height
                            
                            ZStack {
                                ForEach(0..<Constants.CounterView.amountOfNumbers) { i in
                                    Text("\(Constants.CounterView.amountOfNumbers - i)")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .font(.custom("FugazOne-Regular", size: sizes[Constants.CounterView.amountOfNumbers - 1 - i]))
                                        .offset(y: height - positions[Constants.CounterView.amountOfNumbers - 1 - i])
                                }
                                if showGo {
                                    Text(Constants.CounterView.goText)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        .font(.custom("FugazOne-Regular", size: goSize))
                                        .opacity(goOpacity)
                                        .foregroundColor(Constants.CounterView.goColor)
                                }
                            }
                            .onAppear {
                                for i in 0..<Constants.CounterView.amountOfNumbers {
                                    withAnimation(
                                        Constants.CounterView.counterAnimation
                                            .delay(
                                                Constants.CounterView.showHideAnimationDurationWithDelay +
                                                Constants.CounterView.counterAnimationFullDuration * Double(i))
                                    ) {
                                        sizes[Constants.CounterView.amountOfNumbers - 1 - i] = Constants.CounterView.numberMaxSize
                                        positions[Constants.CounterView.amountOfNumbers - 1 - i] = height / 2 + Constants.CounterView.numberMaxSize / 2
                                    }
                                    withAnimation(
                                        Constants.CounterView.counterAnimation
                                            .delay(
                                                Constants.CounterView.showHideAnimationDurationWithDelay +
                                                Constants.CounterView.counterAnimationHalfDuration +
                                                Constants.CounterView.counterAnimationFullDuration * Double(i))
                                    ) {
                                        sizes[Constants.CounterView.amountOfNumbers - 1 - i] = 0
                                        positions[Constants.CounterView.amountOfNumbers - 1 - i] = height + 500
                                    }
                                }
                                withAnimation(
                                    Constants.CounterView.blackoutAnimation
                                        .delay(
                                            Constants.CounterView.showHideAnimationDurationWithDelay +
                                            Constants.CounterView.counterAnimationFullDuration * CGFloat(Constants.CounterView.amountOfNumbers))
                                ) {
                                    color = .black
                                    showGo = true
                                }
                                withAnimation(
                                    Constants.CounterView.goAnimation
                                        .delay(
                                            Constants.CounterView.showHideAnimationDurationWithDelay +
                                            Constants.CounterView.counterAnimationFullDuration * CGFloat(Constants.CounterView.amountOfNumbers)
                                            + Constants.CounterView.blackoutAnimationDuration)
                                ) {
                                    goOpacity = 0
                                    goSize = Constants.CounterView.goMaxSize
                                }
                                
                                DispatchQueue.main.asyncAfter(
                                    deadline: .now() +
                                    Constants.CounterView.showHideAnimationDurationWithDelay +
                                    Constants.CounterView.whenToGoNext
                                ) {
                                    showTrainingView = true
                                    showView = false
                                }
                            }
                            
                        }
                    )
            }
        }.onAppear {
            withAnimation(Constants.CounterView.showHideAnimation) {
                showView = true
            }
        }
    }
}
