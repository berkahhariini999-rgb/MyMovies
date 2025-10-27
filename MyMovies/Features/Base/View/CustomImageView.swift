//
//  CustomImageView.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

struct CustomImageView: View {
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let movie: Movie
    
    var body: some View {
        AsyncImage(url: URL(string: movie.imageUrlString)) { image in
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            ZStack {
                Color.appGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(itemWidth: 150.0 , itemHeight: 150.0, movie: dev.movie)
    }
}



