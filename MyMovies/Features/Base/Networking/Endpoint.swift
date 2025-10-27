//
//  Endpoint.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

enum Endpoint {
    case trending, topRated, genre, movieReviews(_ movieId: Int)
    
    private var path: String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .genre:
            return "/3/genre/movie/list"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)reviews"
        }
    }
    
    var fullPath: String {
        Constant.apiBaseURL + path
    }
}
