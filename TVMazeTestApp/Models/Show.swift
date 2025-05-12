//
//  Show.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//


import Foundation

struct ImageLinks: Codable {
    let medium: String?
    let original: String?
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}

struct Show: Codable, Identifiable {
    let id: Int
    let name: String
    let image: ImageLinks?
    let schedule: Schedule
    let genres: [String]
    let summary: String?
}
