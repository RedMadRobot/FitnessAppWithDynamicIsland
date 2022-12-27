//
//  ContentView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 22.10.2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @ObservedObject var viewModel = ActivityViewModel()

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 16) {
                Text("Dynamic Island and \nLive Activities Demo")
                    .font(.system(size: 24))
                    .bold()
                
                if viewModel.startButtonDisabled {
                    Text("Now, minimize the app...")
                        .foregroundColor(.teal)
                }
            }
            .padding(.bottom, 24)

            Button {
                startLiveActivity()
            } label: {
                Label("Start Live Activity", systemImage: "play.fill")
                .foregroundColor(viewModel.startButtonDisabled ? .gray : .black)
            }
            .disabled(viewModel.startButtonDisabled)
            
            Button {
                stopLiveActivity()
            } label: {
                Label("Stop Live Activity", systemImage: "stop.fill")
                    .foregroundColor(viewModel.stopButtonDisabled ? .gray : .pink)
            }
            .disabled(viewModel.stopButtonDisabled)
        }
        .padding()
        .onAppear() {
            if !Activity<FitnessAttributes>.activities.isEmpty {
                viewModel.start()
            }
        }
    }
    
    private func startLiveActivity() {
        viewModel.start()
        
        let defaultModel = TrainingModel.defaultModel
        let activityAttributes = FitnessAttributes(
            lessonLength: defaultModel.lengthDescription,
            calories: defaultModel.caloriesDescription,
            complexity: defaultModel.complexity,
            trainingName: defaultModel.trainingName,
            imageName: defaultModel.imageName)

        do {
            _ = try Activity.request(attributes: activityAttributes, contentState: .init())
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    private func stopLiveActivity() {
        viewModel.stop()

        Task {
             for activity in Activity<FitnessAttributes>.activities {
                await activity.end(dismissalPolicy: .immediate)
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
