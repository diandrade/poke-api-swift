//
//  ResponseDetail.swift
//  Pokemon
//
//  Created by iOSLab on 12/04/25.
//

struct PokemonDetail: Decodable {
    let types: [PokemonTypeDetail]
}

struct PokemonTypeDetail: Decodable {
    let type: PokemonType
}

struct PokemonType: Decodable {
    let name: String
}
