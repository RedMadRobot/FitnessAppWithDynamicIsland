//
//  TrainingPlayerView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 05.12.2022.
//

import SwiftUI
import ActivityKit

struct TrainingPlayerView: View {
    
    @State private var showView = false
    
    var body: some View {
        ZStack(alignment: .center) {
            if showView {
                PlayerView(url: Constants.TrainingPlayerView.videoURL)
                    .ignoresSafeArea(.all)
                    .transition(.opacity)
                VStack(alignment: .center) {
                    Spacer()
                    Image("pause-big").frame(width: 96, height: 96)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            withAnimation(Constants.TrainingPlayerView.showAnimation) {
                showView = true
            }
        }
    }
    
}
