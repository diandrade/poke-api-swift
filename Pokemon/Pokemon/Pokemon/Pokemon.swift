struct Response: Decodable {
    let id: Int
    let name: String
    let types: [PokemonTypeEntry]
    let sprites: Sprites

    struct Sprites: Decodable {
        let front_default: String
    }

    struct PokemonTypeEntry: Decodable {
        let slot: Int
        let type: PokemonType
    }

    struct PokemonType: Decodable {
        let name: String
    }
    
}
