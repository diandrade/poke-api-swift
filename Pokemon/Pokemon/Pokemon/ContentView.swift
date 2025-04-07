//
//  ContentView.swift
//  Pokemon
//
//  Created by iOSLab on 05/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List(pokemons) { pokemon in
                    PokemonCardView(pokemon: pokemon)
                        .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .background(
                            NavigationLink("") {
                                let index = pokemons.firstIndex { $0.name == pokemon.name }
                                PokemonDetailView(index: index ?? 0, pokemon: pokemon)
                            }
                            .opacity(0)
                        )
                        .onAppear {
                            let index = pokemons.firstIndex { $0.name == pokemon.name }
                            guard let index else { return }
                            if index == pokemons.count - 1 {
                                print("fim")
                            }
                        }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                Spacer()
            }
            .padding(16)
            .onAppear {
                Task {
                    do {
                        pokemons = try await Network.shared.fetchCharacters()
                    } catch {
                        print("Erro ao buscar personagens: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
