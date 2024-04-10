//
//  ContentView.swift
//  ApexPredators
//
//  Created by Chad Eymard on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    @State private var isAlphabetical: Bool = false
    @State private var currentSelection: PredatorType = PredatorType.all
    
    let predators = Predators()
    
    var filteredPredators: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: isAlphabetical)
        return predators.search(for: searchText)
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List(filteredPredators) { predator in
                
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                } label: {
                    HStack {
                        // dinousaur image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack (alignment:.leading) {
                            // dinosaur name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            // dinosaur type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.backgroundColor)
                                .clipShape(Capsule())
                            } //: VSTACK
                        } //: HSTACK
                    } //: NAVIGATION LINK
            } //: LIST
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.easeInOut, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation(.easeIn) {
                            isAlphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: isAlphabetical ? "film" : "textformat")
                            .foregroundColor(.white)
                            .symbolEffect(.bounce, value: isAlphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(PredatorType.allCases) {
                                type in
                                
                                HStack {
                                    Label(type.rawValue.capitalized, systemImage: type.icon)
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                    }
                }
            }
        } //: NAVIGATION
        .preferredColorScheme(.dark)
    }
}

// MARK: - PREVIEW
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
