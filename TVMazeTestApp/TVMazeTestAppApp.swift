//
//  TVMazeTestAppApp.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//

import SwiftUI

@main
struct TVMazeTestAppApp: App {
    @StateObject var pinViewModel = PINViewModel()
    
    var body: some Scene {
        WindowGroup {
            if pinViewModel.isPINConfigured() {
                if pinViewModel.isPINCorrect {
                    ShowListView()
                } else {
                    PINView(viewModel: pinViewModel)
                }
            } else {
                PINSetupView(viewModel: pinViewModel)
            }
        }
    }
}
