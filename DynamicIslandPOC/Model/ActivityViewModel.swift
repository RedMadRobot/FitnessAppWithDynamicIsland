//
//  ActivityViewModel.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 25.11.2022.
//

import Foundation

class ActivityViewModel: ObservableObject {

    @Published var startButtonDisabled = false
    @Published var stopButtonDisabled = true

    func start() {
        startButtonDisabled = true
        stopButtonDisabled = false
    }
        
    func stop() {
        startButtonDisabled = false
        stopButtonDisabled = true
    }
}
