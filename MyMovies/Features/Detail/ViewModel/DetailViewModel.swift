//
//  DetailViewModel.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//
import Foundation
import Combine

@MainActor
class DetailViewModel: ObservableObject {
    
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    
    private let movieService = MovieService()
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async {
        do {
            let response: ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            reviews = response.results
        } catch {
            print("Error: \(error)")
        }
    }
}
