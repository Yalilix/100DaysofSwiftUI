//
//  ContentView.swift
//  Moonshot
//
//  Created by Yanlin Li  on 26/11/2025.
//

import SwiftUI

struct ContentView: View {
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  let missions: [Mission] = Bundle.main.decode("missions.json")
  
  @State private var showingGrid = false
  
  var body: some View {
    NavigationStack {
      Group {
        if showingGrid {
          GridLayout(missions: missions, astronauts: astronauts)
        } else {
          ListLayout(missions: missions, astronauts: astronauts)
        }
      }
    }
    .navigationTitle("Moonshot")
    .background(.darkBackground)
    .preferredColorScheme(.dark)
    .toolbar {
      Button {
        showingGrid.toggle()
      } label: {
        Image(systemName: showingGrid ? "square.grid.2x2" : "line.3.horizontal")
      }
    }
  }
}

struct GridLayout: View {
  let missions: [Mission]
  let astronauts: [String: Astronaut]
  
  let columns = [
      GridItem(.adaptive(minimum: 150))
  ]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(missions) { mission in
            NavigationLink {
              MissionView(mission: mission, astronauts: astronauts)
            } label: {
              VStack {
                Image(mission.image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 100, height: 100)
                  .padding()
                
                VStack {
                  Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                  Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.lightBackground)
              }
              .clipShape(.rect(cornerRadius: 10))
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.lightBackground)
              )
            }
          }
        }
        .padding([.horizontal, .bottom])
      }
    }
  }
}

struct ListLayout: View {
  let missions: [Mission]
  let astronauts: [String: Astronaut]
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(missions) { mission in
          NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
          } label: {
            HStack(spacing: 30) {
              Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
              
              VStack {
                Text(mission.displayName)
                  .font(.headline)
                  .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                  .font(.caption)
                  .foregroundStyle(.white.opacity(0.5))
              }
            }
            
          }
        }
      }
      .scrollContentBackground(.hidden)
      .listRowBackground(Color.darkBackground)
      .listStyle(.plain)
      .padding([.horizontal, .bottom])
    }
  }
}

#Preview {
  ContentView()
}
