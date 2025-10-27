//
//  Poppins.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

enum Poppins: String {
    case black,bold,light,medium,regular, semiBold
    
    var fontName: String {
        return "Poppins-\(self.rawValue.capitalizedFirst)"
    }
}
