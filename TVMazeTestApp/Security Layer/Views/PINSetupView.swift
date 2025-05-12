//
//  PINSetupView.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 10/05/2025.
//


import SwiftUI

struct PINSetupView: View {
    @ObservedObject var viewModel: PINViewModel

    var body: some View {
        VStack {
            SecureField("Create a PIN", text: $viewModel.pinInput)
                .keyboardType(.numberPad)
                .padding()
                .multilineTextAlignment(.center)

            Button("Save PIN") {
                viewModel.savePIN(viewModel.pinInput)
            }
            .padding()
        }
        .padding()
    }
}
