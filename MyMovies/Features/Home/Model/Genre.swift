//
//  Genre.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
}

struct GenreResponse: Codable {
    let genres: [Genre]
}
