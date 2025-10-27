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
    @Published var moviesForSelectedGenre: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var errorMsg = ""
    @Published var selectedGenre = DeveloperPreview.instance.genre
    
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
    
    func fetchGenre() async {
        do {
            let response: GenreResponse = try await
            movieService.fetchData(api: .init(endpoint: .genre))
            genre = response.genres
            if let genre = genre.first {
                selectedGenre = genre
               await fetchMoviesForSelectedGenre()
            }
        } catch {
            errorMsg = "Error: \(error)"
        }
    }
    
    func fetchMoviesForSelectedGenre() async {
        do {
            let api = ApiConstructor(endpoint: .discoverMovies, params :
                                     [
                                        "with_genres:": "\(selectedGenre.id)"
                                     ])
            let response: MovieResponse = try await movieService.fetchData(api: api)
            moviesForSelectedGenre = response.results
        } catch {
            errorMsg = "Error: \(error)"
        }
    }
}


