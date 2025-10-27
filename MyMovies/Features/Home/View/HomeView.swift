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
   // let namespace: Namespace.ID
    @Namespace var namespace
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
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                   
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.genre) { genre in
                            GenreCard(genre: genre, namespace: namespace, selectedGenre: $vm.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        vm.selectedGenre = genre
                                        Task {
                                            await vm.fetchMoviesForSelectedGenre()
                                        }
                                    }
                                    
                                }
                        }
                    }
                   
                }
                
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    ], spacing: 20) {
                    ForEach(vm.moviesForSelectedGenre) { movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.appBackground)
        .fullScreenCover(item: $vm.selectedMovie) {
            movie in
            DetailView(movie: movie)
        }
        .task {
            await vm.fetchTrendingMoviews()
            await vm.fetchTopRatedMoviews()
            await vm.fetchGenre()
            await vm.fetchMoviesForSelectedGenre()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
   
}
