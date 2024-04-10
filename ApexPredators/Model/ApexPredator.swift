//
//  ApexPredator.swift
//  ApexPredators
//
//  Created by Chad Eymard on 4/6/24.
//

import SwiftUI

struct ApexPredator: Identifiable, Codable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        self.name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Codable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum PredatorType: String, Codable, CaseIterable, Identifiable {
    case all
    case air
    case land
    case sea

    var id: PredatorType {
        self
    }
    
    var backgroundColor: Color {
        switch self {
        case .all:
                .black
        case .air:
                .teal
        case .land:
                .brown
        case .sea:
                .blue
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .air:
            "wind"
        case .land:
            "leaf.fill"
        case .sea:
            "drop.fill"
        }
    }
}
