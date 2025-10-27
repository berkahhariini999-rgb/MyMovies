//
//  HomeView.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @StateObject private var vm = HomeViewModel()
    var body: some View {
        ScrollView (showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) { 
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchTxt: $searchText)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) { movie in
                            MovieCard(movie: movie)
                        }
                    }
                   
                }
                
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    ], spacing: 20) {
                    ForEach(vm.topRatedMovies) { movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.appBackground)
        .task {
            await vm.fetchTrendingMoviews()
            await vm.fetchTopRatedMoviews()
        }
    }
}

#Preview {
    HomeView()
}
