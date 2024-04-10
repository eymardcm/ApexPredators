//
//  Predators.swift
//  ApexPredators
//
//  Created by Chad Eymard on 4/9/24.
//

import SwiftUI

class Predators {
    
    var predators: [ApexPredator]
    
    init() {
        self.predators = Bundle.main.decode("jpapexpredators.json")
    }
    
    func search(for searchText: String) -> [ApexPredator] {
        if searchText.count == 0 {
            return predators
        } else {
            return predators.filter {
                predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
    }
    
    func sort(by alphabetical: Bool) {
        predators.sort { predator1, predator2 in
            switch alphabetical {
            case true:
                predator1.name < predator2.name
            case false:
                predator1.id < predator2.id
            }
        }
        
    }
    
    func filter(by type: PredatorType) {
        self.predators = Bundle.main.decode("jpapexpredators.json")
        predators = type == .all ? predators : predators.filter {
            predator in
            predator.type == type
        }
    }
}
