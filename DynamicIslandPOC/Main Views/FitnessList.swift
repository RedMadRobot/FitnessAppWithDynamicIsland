//
//  FitnessList.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 21.11.2022.
//

import Foundation
import SwiftUI

struct FitnessList: View {
    
    @State var showDetailView = false
    @State var currentWorkout: TrainingModel?
    @State var showAllView = true
    @State var goNext = false
    @State var onClose = false
    
    var workouts: [TrainingModel] = TrainingModel.mockWorkouts
    
    var body: some View {
        NavigationView {
            ZStack {
                PlayerView(url: Constants.DetailView.videoURL).ignoresSafeArea(.all).zIndex(-1)
                
                if showDetailView, let workout = currentWorkout {
                    DetailView(withPlayerView: false, onClose: $onClose, workout: workout)
                }
                if showAllView {
                    ZStack {
                        Constants.FitnessList.backgroundColor
                            .ignoresSafeArea(.all)
                        VStack(alignment: .leading) {
                            Text(Constants.FitnessList.text1stLine)
                                .padding(.vertical, -20)
                                .foregroundColor(.black)
                                .title(size: 68)
                                .bold()
                            Text(Constants.FitnessList.text2ndLine)
                                .padding(.vertical, -20)
                                .foregroundColor(Constants.FitnessList.textColor)
                                .title(size: 68)
                                .bold()
                            Text(Constants.FitnessList.text3rdLine)
                                .padding(.vertical, -20)
                                .foregroundColor(Constants.FitnessList.textColor)
                                .title(size: 68)
                                .bold()
                            Spacer()
                        }
                        .padding(.top, 42)
                        .offset(x: -8)
                        .transition(.opacity)
                        
                        ScrollView {
                            ForEach(workouts, id: \.trainingName) { workout in
                                Button(action: {
                                    currentWorkout = workout
                                    withAnimation(Constants.FitnessList.showHideAnimation) {
                                        showAllView = false
                                    }
                                    showDetailView = true
                                }) {
                                    FitnessRow(workout: workout)
                                }
                                .background(Constants.FitnessList.rowBackground)
                                .cornerRadius(24)
                                .padding([.leading, .trailing], 8)
                                .frame(
                                    width: .infinity,
                                    height: Constants.FitnessList.rowHeight
                                )
                                .buttonStyle(LinkButtonStyle())
                            }
                            .offset(y: 220)
                            
                        }
                        .listStyle(.plain)
                        
                    }
                    .transition(.opacity)
                    .onAppear {
                        withAnimation(
                            Constants.FitnessList.showHideAnimation
                                .delay(Constants.FitnessList.showDelay)
                        ) {
                            showAllView = true
                        }
                    }
                }
            }
            .onChange(of: onClose) { newValue in
                guard newValue else { return }
                
                withAnimation(
                    Constants.FitnessList.showHideAnimation
                        .delay(Constants.FitnessList.showDelay)
                ) {
                    showAllView = true
                    showDetailView = false
                }
            }
        }.zIndex(-2)
    }
}

struct FitnessRow: View {
    
    let workout: TrainingModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                ComplexityView(complexity: workout.complexity)
                Spacer()
                Text(workout.trainingName.uppercased()).title(size: 32)
                Spacer()
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
            .padding(.leading, 30)
            .padding([.top, .bottom], 24)
            
            Image(workout.imageName)
                .frame(width: 152, height: 152)
            HeartImage(pressed: workout.isFavourite, size: .small)
                .padding([.top, .trailing], 20)
        }
        
    }
}
