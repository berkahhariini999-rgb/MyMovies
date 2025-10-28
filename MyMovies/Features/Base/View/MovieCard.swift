//
//  MovieCard.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

struct MovieCard: View {

    let movie: Movie
    var type: MovieCardType = .poster
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension MovieCard {
    var itemWidth: CGFloat {
        screenWidth * type.widthPercent
    }

    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: dev.movie)
    }
}
