// Midterm Project
// Name: Nagihan Tokul
// Date: 10/17/2025

// Description: A SwiftUI app that displays a list of coffee drinks loaded from a JSON file.
// Each item shows an image and name, and when tapped, navigates to a detail view with a larger image and description.

import SwiftUI
import Foundation

// Main View
struct ContentView: View {
    
    let coffees: [Subject] = Bundle.main.decode([Subject].self, from: "Data.json")
    
    var body: some View {
        // Create a navigation container that allows moving between screens
        NavigationView {
            
            // Display the list of coffees loaded from the JSON file
            List(coffees) { coffee in
                // Each list item is a NavigationLink → clicking it opens the DetailView
                NavigationLink(destination: DetailView(item: coffee)) {
                    HStack(spacing: 12) {
                        
                        // Coffee image (from Assets.xcassets)
                        Image(coffee.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 60)
                            .clipped()
                            .cornerRadius(8)
                        
                        // Coffee name text
                        Text(coffee.name)
                            .font(.headline)
                            .lineLimit(2)
                    }
                    .padding(.vertical, 4)
                }
            }
            // Navigation bar title at the top
            .navigationTitle("Nagihan's Coffee Shop ")
        }
    }
}

//  Detail Page
struct DetailView: View {
    let item: Subject  // The selected coffee, coming from Subject.swift
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: 16) {
                
                // Coffee image displayed at a fixed size for consistency
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .clipped()
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    .padding(.bottom, 10)
                
                // Coffee name
                Text(item.name)
                    .font(.title)
                    .bold()
                
                // Coffee description paragraph
                Text(item.description)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}

