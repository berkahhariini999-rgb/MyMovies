//
//  MovieService.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

enum MovieServiceError: Error {
    case invalidResponse
}

actor MovieService {
    func fetchData<T: Decodable>(api: ApiConstructor) async throws -> T {
        let url = try DefaultUrlBuilder.build(api: api)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw MovieServiceError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}

