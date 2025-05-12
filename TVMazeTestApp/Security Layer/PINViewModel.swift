//
//  PINViewModel.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 10/05/2025.
//


import Combine

class PINViewModel: ObservableObject {
    @Published var pinInput: String = ""
    @Published var isPINCorrect: Bool = false
    @Published var error: String?

    private let key = "user_app_pin"

    func savePIN(_ pin: String) {
        KeychainHelper.shared.save(pin, forKey: key)
    }

    func validatePIN() {
        guard let savedPIN = KeychainHelper.shared.read(forKey: key) else {
            error = "No PIN set"
            return
        }

        if pinInput == savedPIN {
            isPINCorrect = true
        } else {
            error = "Invalid PIN"
        }
    }

    func isPINConfigured() -> Bool {
        KeychainHelper.shared.read(forKey: key) != nil
    }
}
