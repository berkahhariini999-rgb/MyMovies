//
//  PreviewProvider.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init(){
        
    }
    
    let movie = Movie(adult: false, backdropPath: "", genreIDS: [1], id: 102, originalLanguage: "", originalTitle: "", overview: "", popularity: 10.0, posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", releaseDate: "", title: "The Shawshank Redemption", video: false, voteAverage: 10.0, voteCount: 1)
    
    let genre = Genre(id: 28, name: "Action")
    let review = Review(author: "Test Author", authorDetails: nil, content: "test content", createdAt: "2025", id: "Test", updatedAt: "Test", url: "Test")
    
}
