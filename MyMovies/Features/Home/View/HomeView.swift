//
//  HomeView.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var body: some View {
        ScrollView (showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) { 
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchTxt: $searchText)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<5, id: \.self) { _ in
                            MovieCard(movie: DeveloperPreview.instance.movie)
                        }
                    }
                   
                }
                
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    ], spacing: 20) {
                    ForEach(1..<15, id: \.self) { _ in
                        MovieCard(movie: DeveloperPreview.instance.movie, type: .grid)
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.appBackground)
    }
}

#Preview {
    HomeView()
}
