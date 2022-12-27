//
//  DetailView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 31.10.2022.
//

import SwiftUI
import ActivityKit

struct DetailView: View {
    
    @State private var currentValue = 0.0
    @State private var showView = true
    @State private var firstShowView = false
    @State var dragEnded = false
    @State var withPlayerView: Bool
    @State var showCounterView: Bool = false
    @Binding var onClose: Bool
    
    let workout: TrainingModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if withPlayerView && !showCounterView {
                PlayerView(url: Constants.DetailView.videoURL).ignoresSafeArea(.all).zIndex(-1)
            }
            if showCounterView {
                CounterView()
            }
            // Nav Bar
            if showView {
                HStack {
                    BackButton(size: 48).onTapGesture {
                        withAnimation(Constants.DetailView.showHideAnimation) {
                            showView = false
                            onClose = true
                        }
                    }
                    Spacer()
                    HeartImage(pressed: workout.isFavourite, size: .big)
                }
                .zIndex(2)
                .transition(.opacity)
                .padding([.leading, .trailing], 16)
            }
            
            if showView {
                VStack {
                    Spacer()
                    if firstShowView {
                        VStack {
                            VStack(alignment: .leading, spacing: 16) {
                                HeadingView(workout: workout)
                                Text(workout.description)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                Label {
                                    Text(workout.equipment.joined(separator: ", "))
                                } icon: {
                                    Image("dumbbell-big")
                                        .resizable()
                                        .scaledToFit()
                                }
                                .subtitle()
                                Spacer()
                                
                                SliderView(value: $currentValue, dragEnded: $dragEnded)
                                    .frame(
                                        maxWidth: .infinity,
                                        minHeight: Constants.Slider.thumbHeight,
                                        maxHeight: Constants.Slider.thumbHeight
                                    )
                                    .padding([.leading, .trailing], -4)
                            }
                            .padding(.top, 32)
                            .padding([.leading, .trailing, .bottom], 26)
                        }
                        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: 395)
                        .background(Constants.DetailView.cardBackgroundColor)
                        .cornerRadius(44)
                        .padding(8)
                        .transition(.opacity)
                        .zIndex(2)
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
        .onAppear {
            withAnimation(Constants.DetailView.showHideAnimation) {
                firstShowView = true
            }
        }
        .onChange(of: dragEnded) { newValue in
            guard newValue else { return }
            
            withAnimation(Constants.DetailView.showHideAnimation.delay(
                Constants.DetailView.delayBeforeNewSlide)
            ) {
                showView = false
                firstShowView = false
                showCounterView = true
            }
        }
    }
}

struct HeadingView: View {
    
    let workout: TrainingModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ComplexityView(complexity: workout.complexity)
            
            Text(workout.trainingName.uppercased())
                .title(size: 48)
                .padding(.vertical, -4)
                .bold()
            HStack(spacing: 16) {
                Label {
                    Text(workout.lengthDescription)
                } icon: {
                    Image("clock-big")
                        .resizable()
                        .scaledToFit()
                }
                .subtitle()
                .labelStyle(CenteredLabelStyle())
                
                Label {
                    Text(workout.caloriesDescription)
                } icon: {
                    Image("lightning-big")
                        .resizable()
                        .scaledToFit()
                }
                .subtitle()
                .labelStyle(CenteredLabelStyle())
                
                Spacer()
            }
        }
    }
}
