//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by iOSLab on 05/04/25.
//

import SwiftUI

struct PokemonDetailView: View {
    let index: Int
    var pokemon: Pokemon
    @State var detail: PokemonDetail? = nil
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(index + 1).png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            Text(pokemon.name)
            Text(detail?.types.first?.type.name ?? "Erro")
            
        }
        .frame(height: 200)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
        
        //Chamada da API de detalhes
        .onAppear {
            Task {
                do {
                    detail = try await Network.shared.fetchDetail(name: pokemon.name)
                } catch {
                    print("Erro ao buscar personagens: \(error.localizedDescription)")
                }
            }
        }
    }
}
