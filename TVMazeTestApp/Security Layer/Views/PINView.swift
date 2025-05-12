//
//  PINView.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 10/05/2025.
//


import SwiftUI

struct PINView: View {
    @ObservedObject var viewModel: PINViewModel

    var body: some View {
        VStack {
            SecureField("Enter PIN", text: $viewModel.pinInput)
                .keyboardType(.numberPad)
                .padding()
                .multilineTextAlignment(.center)

            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
            }

            Button("Unlock") {
                viewModel.validatePIN()
            }
            .padding()
        }
        .padding()
    }
}
