//
//  DetailView.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

enum DetailViewSection : String {
    case about, review
    
    var rawValue: String {
        switch self {
        case .about :
            return "About Movie"
        case .review :
            return "Reviews"
        }
    }
}

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    init(movie: Movie) {
       _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    var body: some View {
        VStack (alignment: .leading) {
           header
            
            VStack {
                HStack {
                    Image.CalendarIcon
                    Text("2025")
                    Text(" | ")
                    Image.ClockIcon
                    Text("148 Minutes")
                    Text(" | ")
                    Image.GenreIcon
                    Text("Action")
                    Text(" | ")
                    
                }
                .foregroundStyle(.appGrayColor2)
                .frame(maxWidth: .infinity)
                
                HStack {
                    ForEach(vm.sections, id: \.self){
                        section in
                        DetailSectionCard(section: section, namespace: namespace, selectedSelection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    vm.selectedSection = section
                                }
                            }
                    }
                }
                switch vm.selectedSection {
                case .about:
                    Text(vm.movie.overview)
                case .review:
                    Text("Review")
                }
                
                Spacer()
            }
            
            .padding()
            .padding(.top, contentOffset)
            
        }
        .preferredColorScheme(ColorScheme.dark)
        .background(Color.AppBackgroundColor)
        task {
            await vm.fetchReviews()
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    
    var backdropImageSize: CGFloat {
        screenHeight * 0.22
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.12
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.12
    }
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    private var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: dev.movie)
    }
}


private extension DetailView {
    var header: some View {
        ZStack (alignment: .leading) {
            ZStack (alignment: .top){
                CustomImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
                
                HStack {
                    Image.BackIcon
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text("Detail")
                    Spacer()
                    Image.BookmarkIcon
                }
                .padding()
                .background(Color.AppBackgroundColor)
            }
            
            HStack  {
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: vm.movie, imageType: .backdrop)
                    
                    Text(vm.movie.title)
                        .minimumScaleFactor(0.5)
                        .padding(.top, titleOffset)
               
            }
            .padding()
            .offset(y: backdropImageOffset)
        }
    }
}
