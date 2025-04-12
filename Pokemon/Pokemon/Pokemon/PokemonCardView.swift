//
//  PokemonCardView.swift
//  Pokemon
//
//  Created by iOSLab on 05/04/25.
//

import SwiftUI

struct PokemonCardView: View {
    var pokemon: Response
    var backgroundGradient: LinearGradient {
        return TypeColor.gradient(for: pokemon.typeNames.first ?? "normal")
    }

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .padding(.bottom, 10)
            }
            .frame(width: 200, height: 250)
            .background(backgroundGradient)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
            .padding()
        }
    }
}
