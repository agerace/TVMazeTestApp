//
//  Episode.swift
//  TVMazeTestApp
//
//  Created by Cesar Andres Gerace on 09/05/2025.
//


import Foundation

struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let summary: String?
    let image: ImageLinks?
}
