//
//  PokemonCardView.swift
//  Pokemon
//
//  Created by iOSLab on 05/04/25.
//

import SwiftUI

struct PokemonCardView: View {
    var pokemon: Pokemon
    var body: some View {
        VStack {
            Text(pokemon.name)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 16))
    }
}
