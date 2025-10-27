//
//  View.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import SwiftUI

extension View {
    func poppins(_ font: Poppins, _ size: CGFloat = 14) -> some View {
        self.font(.custom(font.fontName, size: size))
    }
}
