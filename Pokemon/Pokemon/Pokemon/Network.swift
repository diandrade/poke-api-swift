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

    func fetchCharacters() async throws -> [Pokemon] {
        let endpoint = "https://pokeapi.co/api/v2/pokemon"

        guard let url = URL(string: endpoint) else {
            throw NSError(domain: "Invalid URL", code: 0)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError(domain: "Invalid response", code: (response as? HTTPURLResponse)?.statusCode ?? 500)
        }

        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.results
        } catch {
            print("Erro de decodificação: \(error.localizedDescription)")
            throw error
        }
    }
}
