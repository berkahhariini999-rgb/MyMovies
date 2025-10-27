//
//  HomeViewModel.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var errorMsg = ""
    
    private let movieService = MovieService()
    
    func fetchTrendingMoviews() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            trendingMovies = movieApiResponse.results
        } catch {
            errorMsg =  "Error: \(error)"
        }
    }
    
    func fetchTopRatedMoviews() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
            topRatedMovies = movieApiResponse.results
        } catch {
            errorMsg =  "Error: \(error)"
        }
    }
}


