//
//  SearchBar.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchTxt: String
    
    var body: some View {
        TextField("Search", text: $searchTxt)
            .overlay(
                ZStack {
                    Image.CancelIcon
                        .foregroundStyle(Color.white)
                        .opacity(searchTxt.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchTxt = ""
                            UIApplication.shared.endEditing()
                        }
                    Image.SearchIcon
                        .opacity(searchTxt.isEmpty ? 1.0 : 0.0)
                }
                , alignment: .trailing)
            .foregroundStyle(Color.white)
           // .foregroundStyle(Color.appGrayColor2)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.AppGrayColor1)
            )
    }
}

#Preview {
    SearchBar(searchTxt: .constant(""))
}
