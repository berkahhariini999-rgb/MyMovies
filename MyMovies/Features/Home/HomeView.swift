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
            LazyVStack(alignment: .leading) {
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchTxt: $searchText)
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
