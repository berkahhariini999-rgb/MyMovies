//
//  ReviewCard.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) {
                    image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Color.appGrayColor1
                        
                        if let firstChart = review.authorName.first {
                            Text(String(firstChart))
                            
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                
                Text(review.authorName)
                    .poppins(.medium, 16)
            }
            
            Text(review.content)
                .poppins(.light)
            
            Divider()
        }
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: dev.review)
    }
}
