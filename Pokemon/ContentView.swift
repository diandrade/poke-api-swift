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
                
                //Adicionar Header View para lidar com informacoes no topo da aplicacao
                
                List(pokemons) { pokemon in
                    let index = pokemons.firstIndex { $0.name == pokemon.name }
                    if index == 0 {
                        if UIImage(named: "pokemon-go") != nil {
                                    Image("pokemon-go")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                }
                    }
                    
                    PokemonCardView(pokemon: pokemon)
                        .listRowInsets(.init(top: 32, leading: 32, bottom: 0, trailing: 32))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    
                        .swipeActions(edge: .leading) {
                                    Button {
                                        print("Favorited: \(pokemon.name)")
                                    } label: {
                                        Label("Favorite", systemImage: "star.fill")
                                    }
                                    .tint(.yellow) // Custom tint for favorite
                                }
                    
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                print("Item deletado")
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    
                        .background(
                            NavigationLink("") {
                                
                                PokemonDetailView(index: index ?? 0, pokemon: pokemon)
                            }
                            .opacity(0)
                        )
                        .onAppear {
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
            
            //Chamada da API dos pokemons
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
