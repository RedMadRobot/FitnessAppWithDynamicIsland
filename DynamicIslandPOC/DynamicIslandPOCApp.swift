//
//  DynamicIslandPOCApp.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 22.10.2022.
//

import SwiftUI

@main
struct DynamicIslandPOCApp: App {
    
    @State var deeplinkTarget: DeeplinkTarget?
    @State var onClose = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch self.deeplinkTarget {
                case .home, .none:
                    ContentView()
                case .details:
                    DetailView(withPlayerView: true, onClose: $onClose, workout: TrainingModel.defaultModel)
                case .list:
                    FitnessList()
                }
            }
            .onOpenURL { url in
                guard url.scheme == "widget" else { return }
                deeplinkTarget = DeeplinkTarget(rawValue: url.host ?? "")
            }
            .onChange(of: onClose) { newValue in
                guard newValue else { return }
                
                deeplinkTarget = .home
            }
        }
    }
}
