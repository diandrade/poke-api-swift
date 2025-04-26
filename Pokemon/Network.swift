//
//  Network.swift
//  Pokemon
//
//  Created by iOSLab on 05/04/25.
//

import Foundation

class Network {
    static let shared = Network()
    private init() {}
    
    private func fetch(endpoint: String) async throws -> (data: Data, response: URLResponse){
        guard let url = URL(string: endpoint) else {
            throw NSError(domain: "Invalid URL", code: 0)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: (response as? HTTPURLResponse)?.statusCode ?? 500)
        }

        return (data, response)
    }

    func fetchCharacters() async throws -> [Pokemon] {
        do {
            let fetchReponse = try await fetch(endpoint: "https://pokeapi.co/api/v2/pokemon")
            let response = try JSONDecoder().decode(ResponseList.self, from: fetchReponse.data)
            return response.results
        } catch {
            print("Erro de decodificação: \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchDetail(name: String) async throws -> PokemonDetail {
        do {
            let fetchReponse = try await fetch(endpoint: "https://pokeapi.co/api/v2/pokemon/\(name)")
            let response = try JSONDecoder().decode(PokemonDetail.self, from: fetchReponse.data)
            return response
        } catch {
            print("Erro de decodificação: \(error.localizedDescription)")
            throw error
        }
    }
}
